(load "examples/coercion-table.scm")

(define (new-complex real imag)
  (cons 'complex (cons real imag)))

(define (new-complex-integer real imag)
  (new-complex (cons 'integer real) imag))

(define (new-complex-rational real-dividend real-divisor imag)
  (new-complex (cons 'rational (cons real-dividend real-divisor)) imag))

(define (new-complex-real real imag)
  (new-complex (cons 'real real) imag))

(define (get-tag number) (car number))
(define (get-value number) (cdr number))
(define (get-real-part x) (car (get-value x)))
(define (get-imag-part x) (cdr (get-value x)))

(define type-tower '(integer rational real))

(define (get-level type type-tower)
  (define (next level remaining)
    (if (null? type)
	(error (string type " not found in " type-tower))
	(let ((head (car remaining))
	      (tail (cdr remaining)))
	  (if (eq? type head)
	      level
	      (next (+ level 1) tail)))))
  (next 0 type-tower))

(define (find-common-type a b)
  (let ((type-a (car a))
	(type-b (car b)))
    (let ((level-a (get-level type-a type-tower))
	  (level-b (get-level type-b type-tower)))
      (cond ((> level-a level-b) type-a)
	    ((< level-a level-b) type-b)
	    (else type-a)))))

(define (find-next-type orig-type)
  (define (next previous current remaining)
    (if (null? remaining)
	current
	(let ((head (car remaining))
	      (tail (cdr remaining)))
	  (if (eq? previous orig-type)
	      current
	      (next current head tail)))))
  (next (car type-tower) (cadr type-tower) (cddr type-tower)))

(define (coerce-integer->rational x)
  (let ((value (get-value x)))
    (cons 'rational (cons value 1))))

(define (coerce-rational->real x)
  (let ((value (get-value x)))
    (cons 'real (/ (car value) (cdr value)))))

(define (install-coercions)
  (put-coercion 'integer 'rational coerce-integer->rational)
  (put-coercion 'rational 'real coerce-rational->real)
  'done)

(define (raise x to-type)
  (define (raise-next x)
    (let ((current-type (get-tag x)))
      (if (eq? current-type to-type)
	  x
	  (let ((next-type (find-next-type current-type)))
	    (let ((coercion (get-coercion current-type next-type)))
	      (if (not coercion)
		  (error (string "no coercion " current-type "->" next-type " found"))
		  (let ((raised (coercion x)))
		    (raise-next raised))))))))
  (raise-next x))

(define (install-eq-ops)
  (define (eq-integer? a b)
    (and
     (eq? (get-tag a) (get-tag b))
     (= (get-value a) (get-value b))))
  (define (eq-rational? a b)
    (and
     (eq? (get-tag a) (get-tag b))
     (let ((val-a (get-value a))
	   (val-b (get-value b)))
       (let ((denom-a (car val-a))
	     (denom-b (car val-b))
	     (numer-a (cdr val-a))
	     (numer-b (cdr val-b)))
	 (= (* denom-a numer-b) (* denom-b numer-a))))))
  (define (eq-real? a b)
    (and
     (eq? (get-tag a) (get-tag b))
     (= (get-value a) (get-value b))))
    (put 'eq '(integer integer) eq-integer?)
    (put 'eq '(rational rational) eq-rational?)
    (put 'eq '(real real) eq-real?)
    'done)

(define (complex-eq? a b)
  (let ((real-part-a (get-real-part a))
	(real-part-b (get-real-part b))
	(imag-part-a (get-imag-part a))
	(imag-part-b (get-imag-part b)))
    (let ((to-real-type (find-common-type real-part-a real-part-b)))
      (let ((raised-real-part-a (raise real-part-a to-real-type))
	    (raised-real-part-b (raise real-part-b to-real-type))
	    (eq-op? (get 'eq (list to-real-type to-real-type))))
	(if (null? eq-op?)
	    (error (string "missing eq op for type " to-real-type))
	    (and (= imag-part-a imag-part-b)
		 (eq-op? raised-real-part-a raised-real-part-b)))))))

(install-coercions)
(install-eq-ops)

(define a (new-complex-integer 3 4))
(define b (new-complex-rational 6 2 4))
(define c (new-complex-real 3.0 4))
(define d (new-complex-real 2.0 4))
(define e (new-complex-real 3.0 5))

;; trivial cases:
;; (complex-eq? a a)
;; #t
;; (complex-eq? b b)
;; #t
;; (complex-eq? c c)
;; #t
;; (complex-eq? d d)
;; #t
;; (complex-eq? e e)
;; #t

;; other cases:
;; (complex-eq? a b)
;; #t
;; (complex-eq? a c)
;; #t
;; (complex-eq? a d)
;; #f
;; (complex-eq? a e)
;; #f
;; (complex-eq? b c)
;; #t
;; (complex-eq? b d)
;; #f
;; (complex-eq? b e)
;; #f
;; (complex-eq? c d)
;; #f
;; (complex-eq? c e)
;; #f
;; (complex-eq? d e)
;; #f

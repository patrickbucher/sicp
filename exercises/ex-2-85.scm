(load "examples/op-type-table.scm")
(load "examples/coercion-table.scm")
(load "exercises/ex-2-84.scm") ;; providing raise-all

(define type-tower '(integer rational real complex))

(define (set-tag value tag) (cons tag value))
(define (get-tag object) (car object))
(define (get-value object) (cdr object))

(define (new-integer x) (set-tag x 'integer))
(define (new-rational x y) (set-tag (cons x y) 'rational))
(define (new-real x) (set-tag x 'real))
(define (new-complex real imag) (set-tag (cons real imag) 'complex))

(define (complex->real x)
  (new-real (car (get-value x))))

(define (real->rational x)
  (new-rational (round (get-value x)) 1))

(define (rational->integer x)
  (let ((value (get-value x)))
    (let ((dividend (car value))
	  (divisor (cdr value)))
      (new-integer (round (/ dividend divisor))))))

(define (install-coercions)
  (put-coercion 'complex 'real complex->real)
  (put-coercion 'real 'rational real->rational)
  (put-coercion 'rational 'integer rational->integer)
  'done)

(define (eq-object? x y eq-value?)
  (let ((tag-x (get-tag x))
	(tag-y (get-tag y))
	(value-x (get-value x))
	(value-y (get-value y)))
    (and (eq? tag-x tag-y)
	 (eq-value? value-x value-y))))

(define (eq-complex? x y)
  (eq-object? x
	      y
	      (lambda (x y)
		(let ((real-x (car x))
		      (imag-x (cdr x))
		      (real-y (car y))
		      (imag-y (cdr y)))
		  (and (= real-x real-y)
		       (= imag-x imag-y))))))

(define (eq-real? x y)
  (eq-object? x y (lambda (x y) (= x y))))

(define (eq-rational? x y)
  (eq-object? x y (lambda (x y)
		    (let ((num-x (car x))
			  (den-x (cdr x))
			  (num-y (car y))
			  (den-y (cdr y)))
		      (let ((new-num-x (* num-x den-y))
			    (new-den-x (* den-x den-y))
			    (new-num-y (* num-y den-x))
			    (new-den-y (* den-y den-x)))
			(and (= new-num-x new-num-y)
			     (= new-den-x new-den-y)))))))

(define (eq-integer? x y)
  (eq-object? x y (lambda (x y) (= x y))))

(define (install-eqs)
  (put 'eq '(complex complex) eq-complex?)
  (put 'eq '(real real) eq-real?)
  (put 'eq '(rational rational) eq-rational?)
  (put 'eq '(integer integer) eq-integer?)
  'done)

(define (raise-single object to-type)
  (car (raise-all to-type (list object))))

(define (project-complex->real x)
  (let ((dropped (complex->real x)))
    (let ((raised (raise-single dropped 'complex)))
      (if (eq-complex? raised x)
	  dropped
	  #f))))

(define (project-real->rational x)
  (let ((dropped (real->rational x)))
    (let ((raised (raise-single dropped 'real)))
      (if (eq-real? raised x)
	  dropped
	  #f))))

(define (project-rational->integer x)
  (let ((dropped (rational->integer x)))
    (let ((raised (raise-single dropped 'rational)))
      (if (eq-rational? raised x)
	  dropped
	  #f))))

(define (install-projections)
  (put 'project '(complex real) project-complex->real)
  (put 'project '(real rational) project-real->rational)
  (put 'project '(rational integer) project-rational->integer)
  'done)

(define (get-lower type)
  (define (next prev rest)
    (let ((head (car rest))
	  (tail (cdr rest)))
      (if (eq? head type)
	  prev
	  (next head tail))))
  (next '() type-tower))

(define (drop object)
  (define (drop-next object)
    (let ((type (get-tag object)))
      (let ((lower (get-lower type)))
	(let ((project (get 'project (list type lower))))
	  (if (not project)
	      object
	      (let ((dropped (project object)))
		(if (not dropped)
		    object
		    (drop-next dropped))))))))
  (drop-next object))

(install-coercions)
(install-eqs)
(install-projections)

;; (drop (new-integer 3))
;; (integer . 3)

;; (drop (new-rational 3 2))
;; (rational 3 . 2)
;; (drop (new-rational 3 1))
;; (integer . 3)

;; (drop (new-real 3.1))
;; (real . 3.1)
;; (drop (new-real 3.0))
;; (integer . 3.)

;; (drop (new-complex 3 2))
;; (complex 3 . 2)
;; (drop (new-complex 3.5 0))
;; (real . 3.5)
;; (drop (new-complex 3 0))
;; (integer . 3)

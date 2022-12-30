(load "examples/op-type-table.scm")
(load "examples/coercion-table.scm")

(define type-tower '(integer rational real complex))

(define (set-tag value tag) (cons tag value))
(define (get-tag object) (car object))
(define (get-value object) (cdr object))

(define (new-integer x) (set-tag x 'integer))
(define (new-rational x y) (set-tag (cons x y) 'rational))
(define (new-real x y) (set-tag (/ x y) 'real))
(define (new-complex real imag) (set-tag (cons real imag) 'complex))

(define (complex->real x)
  (error "not implemented yet"))
(define (real->rational x)
  (error "not implemented yet"))
(define (rational->integer x)
  (error "not implemented yet"))

(define (install-coercions)
  (put-coercion 'complex 'real complex->real)
  (put-coercion 'real 'rational real->rational)
  (put-coercion 'rational 'integer rational->integer)
  'done)

(define (eq-object? x y eq-value?)
  (let ((tag-x (get-tag x))
	(tag-y (get-tag y))
	(value-x (get-value x))
	(value-y (get-valye y)))
    (and (eq? tag-x tag-y)
	 (eq-value? value-x valye-y))))

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
		    (let ((dividend-x (car x))
			  (divisor-x (cdr x))
			  (dividend-y (car y))
			  (divisor-y (cdr y)))
		      ;; TODO: extend for proper comparison
		      #f))))

(define (eq-integer? x y)
  (eq-object? x y (lambda (x y) (= x y))))

(define (install-eqs)
  (put 'eq '(complex complex) eq-complex?)
  (put 'eq '(real real) eq-real?)
  (put 'eq '(rational rational) eq-rational?)
  (put 'eq '(integer integer) eq-integer?)
  'done)

;; TODO: install generic 'eq procedures.

(define (drop object)
  (define (drop-next object)
    (let ((type (get-tag object)))
      (let ((lower (get-lower type)))
	(let ((eq-op? (get 'eq (list type type))))
	  (let ((dropped (project object lower)))
	    (if (eq-op? object (raise-to dropped type))
		dropped
		(error (string "cannot drop " object " to " type))))))))
  ;; TODO: properly finish implementation
  (drop-next object))

(install-coercions)
(install-eqs)

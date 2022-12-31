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
  (let ((dropped (new-real (car (get-value x)) 1)))
    (let ((raised (raise-single dropped 'complex)))
      (eq-complex? raised x))))

(define (project-real->rational x)
  ;; The value is truncated for the lack of a general solution.
  (let ((dropped (new-rational (round (get-value x)) 1)))
    (let ((raised (raise-single dropped 'real)))
      (eq-real? raised x))))

(define (project-rational->integer x)
  (let ((value (get-value x)))
    (let ((dividend (car value))
	  (divisor (cdr value)))
      (let ((dropped (new-integer (round (/ dividend divisor)))))
	(let ((raised (raise-single dropped 'rational)))
	  (eq-rational? raised x))))))

(define (install-projections)
  (put 'project '(complex real) project-complex->real)
  (put 'project '(real rational) project-real->rational)
  (put 'project '(rational integer) project-rational->integer)
  'done)

(define (get-lower type)
  ;; TODO: implement
  (error "not implemented yet"))

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
(install-projections)

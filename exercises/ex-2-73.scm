;; original procedure

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product
	   (multiplier exp)
	   (deriv (multiplicand exp) var))
	  (make-product
	   (deriv (multiplier exp) var)
	   (multiplicand exp))))
	;; more rules can be added here
	(else (error "unknown expression type: DERIV" exp))))


;; generic procedure

(load "examples/op-type-table.scm")

(define (deriv-generic exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var)
	     1
	     0))
	(else ((get 'deriv (operator exp))
	       (operands exp)
	       var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))


;; 1) For sums and products, generic procedures using tagged data have
;; been put into a table, which can be accessed using the get
;; procedure, a type, and the operator to be used. This approach does
;; not work for numbers and variables, because they are atomic values
;; (i.e. numbers or symbol) as opposed to data structures containing a
;; tag.

;; 2)

(load "exercises/ex-2-56.scm")

(define (install-sum-prod)
  (define (derive-sum ops var)
    (let ((a (car ops))
	  (b (cadr ops)))
      (make-sum (deriv-generic a var)
		(deriv-generic b var))))
  (define (derive-prod ops var)
    (let ((a (car ops))
	  (b (cadr ops)))
      (make-sum
       (make-product a (deriv-generic b var))
       (make-product (deriv-generic a var) b))))
  (put 'deriv '+ derive-sum)
  (put 'deriv '* derive-prod))

(define x (make-product 'a 3))
(define y (make-product 'a 2))
(define z (make-sum x y))
;; (install-sum-prod)
;; (deriv-generic z 'a)
;; 5

(load "examples/op-type-table.scm") ;; set, get
(load "examples/generic-arithmetic.scm") ;; add

;; half-generic procedures (using numbers without wrapping)
(define (=zero? expr)
  (if (number? expr)
      (= expr 0)
      (apply-generic '=zero? expr)))
(define (add a b)
  (if (and (number? a) (number? b))
      (+ a b)
      (apply-generic 'add a b)))
(define (mul a b)
  (if (and (number? a) (number? b))
      (* a b)
      (apply-generic 'mul a b)))

(define (install-polynomial-package)
  ;; internal procedures
  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
	  ((empty-termlist? L2) L1)
	  (else
	   (let ((t1 (first-term L1))
		 (t2 (first-term L2)))
	     (cond ((> (order t1) (order t2))
		    (adjoin-term
		     t1 (add-terms (rest-terms L1) L2)))
		   ((< (order t1) (order t2))
		    (adjoin-term
		     t2 (add-terms L1 (rest-terms L2))))
		   (else
		    (adjoin-term
		     (make-term (order t1)
				(add (coeff t1) (coeff t2)))
		     (add-terms (rest-terms L1)
				(rest-terms L2)))))))))
  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
	(the-empty-termlist)
	(add-terms (mul-term-by-all-terms (first-term L1) L2)
		   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
	(the-empty-termlist)
	(let ((t2 (first-term L)))
	  (adjoin-term
	   (make-term (+ (order t1) (order t2))
		      (mul (coeff t1) (coeff t2)))
	   (mul-term-by-all-terms t1 (rest-terms L))))))
  (define (=poly-zero? poly)
    (define (all-terms-zero? terms)
      (if (empty-termlist? terms)
	  #t
	  (let ((head (first-term terms))
		(tail (rest-terms terms)))
	    (if (not (= (coeff head) 0))
		#f
		(all-terms-zero? tail)))))
    (let ((terms (term-list poly)))
      (all-terms-zero? terms)))
  ;; representation of poly
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  ;; representation of terms and term lists
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
	term-list
	(cons term term-list)))
  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))
  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (add-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in same var -- ADD-POLY"
	       (list p1 p2))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error ("Polys not in same var -- MUL-POLY"
		(list p1 p2)))))
  ;; procedures from earlier examples
  (define (attach-tag tag object)
    (cons tag object))
  (define (same-variable? v1 v2)
    (and (variable? v1)
	 (variable? v2)
	 (eq? v1 v2)))
  (define (variable? x) (symbol? x))
  ;; interface to the rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  (put '=zero? '(polynomial) =poly-zero?)
  'done)

(install-polynomial-package)

(define a ((get 'make 'polynomial) 'x '((3 1) (2 2) (1 2) (0 5))))
(define b ((get 'make 'polynomial) 'x '((3 2) (2 1) (1 4) (0 2))))

;; (apply-generic 'add a b)
;; (polynomial x (3 3) (2 3) (1 6) (0 7))
;; (apply-generic 'mul a b)
;; (polynomial x (6 2) (5 5) (4 10) (3 22) (2 17) (1 24) (0 10))

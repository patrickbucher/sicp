(load "examples/op-type-table.scm")

(define (install-polynomial-package)
  ;; internal procedures
  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
	  ((empty-termlist? L2) L1)
	  (else
	   (let ((t1 (first-term L1))
		 (t2 (first-term L2)))
	     (cond ((> (order t1) (order t2))
		    (adjoin-term t1
				 (add-terms (rest-terms L1)
					    L2)))
		   ((< (order t1) (order t2))
		    (adjoin-term t2
				 (add-terms L1
					    (rest-terms L2))))
		   (else
		    (adjoin-term (make-term (order t1)
					    (add (coeff t1)
						 (coeff t2)))
				 (add-terms
				  (rest-terms L1)
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
	  (adjoin-term (make-term (+ (order t1) (order t2))
				  (mul (coeff t1) (coeff t2)))
		       (mul-term-by-all-terms t1 (rest-terms L))))))
  ;; representation of poly
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  ;; TODO: same-variable?
  ;; TODO: variable?
  ;; representation of terms and term lists
  ;; TODO: adjoin-term
  ;; TODO: coeff
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1)
			(variable p2))
	(make-poly (variable p1)
		   (add-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in same var: ADD-POLY"
	       (list p1 p2))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1)
			(variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error ("Polys not in same var: MUL-POLY"
		(list p1 p2)))))
  ;; interface to the rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2)
	 (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2)
	 (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms)
	 (tag (make-poly var terms))))
  'done)

(install-polynomial-package)
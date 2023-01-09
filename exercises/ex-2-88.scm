(load "examples/polynomials.scm")

(define (negate p)
  (define (negate-term t)
    (let ((order (car t))
	  (coeff (cadr t)))
      (list order (* -1 coeff))))
  (let ((tag (car p))
	(var (cadr p))
	(terms (cddr p)))
    (let ((new-poly (list tag var))
	  (negated-terms (map negate-term terms)))
      (append new-poly negated-terms))))

(define (install-subtraction)
  (define (tag p) (cons 'polynomial p))
  (put 'sub '(polynomial polynomial)
       (lambda (p1 p2)
	 ;; put the tag back on for type-based redirection
	 (let ((a (tag p1))
	       (b (tag p2)))
	   (apply-generic 'add a (negate b)))))
  'done)

(install-subtraction)

(define a ((get 'make 'polynomial) 'x '((5 2) (3 5) (2 1) (1 1) (0 7))))
(define b ((get 'make 'polynomial) 'x '((4 3) (3 2) (2 2) (1 4) (0 3))))
;; (apply-generic 'sub a a)
;; (polynomial x)
;; (apply-generic 'sub b b)
;; (polynomial x)
;; (apply-generic 'sub a b)
;; (polynomial x (5 2) (4 -3) (3 3) (2 -1) (1 -3) (0 4))
;; (apply-generic 'sub b a)
;; (polynomial x (5 -2) (4 3) (3 -3) (2 1) (1 3) (0 -4))
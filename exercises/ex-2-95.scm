(load "exercises/ex-2-90.scm")
(load "exercises/ex-2-94.scm")

(define P1 (make-polynomial 'x '((2 1) (1 -2) (0 1))))
(define P2 (make-polynomial 'x '((2 11) (0 7))))
(define P3 (make-polynomial 'x '((1 13) (0 5))))

(define (mul a b)
  (let ((var-a (cadr a))
	(var-b (cadr b))
	(tl-a (cddr a))
	(tl-b (cddr b)))
    (if (eq? var-a var-b)
	(cons 'polynomial (cons var-a (simplify-addition (mul-counted tl-a tl-b))))
	(error "different variables: " var-a " and " var-b))))

(define Q1 (mul P1 P2))
(define Q2 (mul P1 P3))

(define gcd-q1-q2 (greatest-common-divisor Q1 Q2))

;; gcd-q1-q2
;; (polynomial x (2 1458/169) (1 -2916/169) (0 1458/169))

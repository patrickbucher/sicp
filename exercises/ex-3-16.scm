(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))

(define three (cons 'a (cons 'b (cons 'c '()))))
;; (count-pairs three)
;; 3

(define a (cons 'a '()))
(define b (cons 'b '()))
(define c (cons 'c '()))
(set-car! a b)
(set-cdr! a c)
(set-cdr! c b)
;; (count-pairs a)
;; 4

(define x (cons 'x '()))
(define y (cons 'y '()))
(define z (cons 'z '()))
(set-car! x y)
(set-cdr! x y)
(set-car! y z)
(set-cdr! y z)
;; (count-pairs x)
;; 7

(define infinite '(a b c))
(set-cdr! (cddr infinite) infinite)
;; (count-pairs infinite)
;; Aborting!: maximum recursion depth exceeded

(define (add-interval x y)
  (let ((c-l (+ (lower-bound x) (lower-bound y)))
	(c-u (+ (upper-bound x) (upper-bound y))))
    (make-from c-l c-u)))

(define (sub-interval x y)
  (op-interval-brute-force x y -))

(define (mul-interval x y)
  (op-interval-brute-force x y *))

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1. (center y))
			       (percentage y))))

(define (op-interval-brute-force x y op)
  (let ((c-1 (op (lower-bound x) (lower-bound y)))
	(c-2 (op (lower-bound x) (upper-bound y)))
	(c-3 (op (upper-bound x) (lower-bound y)))
	(c-4 (op (upper-bound x) (upper-bound y))))
    (make-from (min c-1 c-2 c-3 c-4)
	       (max c-1 c-2 c-3 c-4))))

(define (make-from c-l c-u)
  (let ((c (/ (+ c-l c-u) 2.)))
    (make-interval c (* (/ (abs (- c c-l)) c) 100.))))

(define (make-interval c p) (cons c p))

(define (center x) (car x))

(define (percentage x) (cdr x))

(define (lower-bound x)
  (let ((c (center x))
	(p (percentage x)))
    (- c (* c (/ p 100.)))))

(define (upper-bound x)
  (let ((c (center x))
	(p (percentage x)))
    (+ c (* c (/ p 100.)))))

(define a (make-interval 100 5))
(define b (make-interval 50 10))

;; c = a + b
;; (add-interval a b)
;; (150. . 6.666666666666667)
;; c = (a + b) + (a + b) - (a + b)
;; (sub-interval (add-interval (add-interval a b) (add-interval a b)) (add-interval a b))
;; (150. . 20.)
;; For addition and subtraction, the center remains, the percentage increases!
;;
;; c = a * b
;; (mul-interval a b)
;; (5025. . 14.925373134328357)
;; c = (a * b) * (a * b) / (a * b)
;; (div-interval (mul-interval (mul-interval a b) (mul-interval a b)) (mul-interval a b))
;; (5360.820895522388 . 42.28284345655311)
;; For multiplication and division, both center and percentage increase!
;;
;; (div-interval a a)
;; (1.0025 . 9.975062344139648)
;;
;; (div-interval a b)
;; (2.0100000000000002 . 14.92537313432836)

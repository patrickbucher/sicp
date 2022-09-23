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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1.0 1.0)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))

(define a (make-interval 80 2.))
(define b (make-interval 120 1.))

;; (par1 a b)
;; (48.029759999999996 . 4.397553516819577)
;; (par2 a b)
;; (48.00479723596168 . 3.5986485676015985)

;; par2 yields tighter error bounds than par1. But the difference of
;; the error bounds is due to a computation that is performed too
;; often. One could device a formula with more redundant operation, which
;; would yield even more error bounds. However, resistors themselves
;; don't get better error bounds by using them in phonier
;; computations. So par2 is not the better program, for its results give
;; a false security.

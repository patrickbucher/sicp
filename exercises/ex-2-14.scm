(define a (make-interval 100 5))
(define b (make-interval 50 10))

;; c = a + b
;; (add-interval a b)
;; (150. . 6.666666666666667)
;; c = (a + b) + (a + b) - (a + b)
;; (sub-interval (add-interval (add-interval a b) (add-interval a b)) (add-interval a b))
;; (150. . 20.)
;; The center remains, the percentage increases!

(define (add-interval x y)
  (let ((c-l (+ (lower-bound x) (lower-bound y)))
	(c-u (+ (upper-bound x) (upper-bound y))))
    (make-from c-l c-u)))

(define (sub-interval x y)
  (let ((c-1 (- (lower-bound x) (lower-bound y)))
	(c-2 (- (lower-bound x) (upper-bound y)))
	(c-3 (- (upper-bound x) (lower-bound y)))
	(c-4 (- (upper-bound x) (upper-bound y))))
    (make-from (min c-1 c-2 c-3 c-4)
	       (max c-1 c-2 c-3 c-4))))

;; TODO: multiplication, division

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

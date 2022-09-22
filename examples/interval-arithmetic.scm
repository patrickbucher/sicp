(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

;; (par1 (make-interval 90 110) (make-interval 75 85))
;; (34.61538461538461 . 56.666666666666664)
;; (/ (* 100. 80.) (+ 100. 80.))
;; 44.4...

(define (par2 r1 r2)
  (let ((one (make-interval 1.0 1.0)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))

;; (par2 (make-interval 90 110) (make-interval 75 85))
;; (40.90909090909091 . 47.94871794871795)
;; (/ 1. (+ (/ 1. 100) (/ 1. 80)))
;; 44.4...

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
		    (lower-bound y))
		 (+ (upper-bound x)
		    (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
		    (upper-bound y))
		 (- (upper-bound x)
		    (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
	       (lower-bound y)))
	(p2 (* (lower-bound x)
	       (upper-bound y)))
	(p3 (* (upper-bound x)
	       (lower-bound y)))
	(p4 (* (upper-bound x)
	       (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
		(make-interval
		 (/ 1.0 (upper-bound y))
		 (/ 1.0 (lower-bound y)))))

(define (make-interval lower upper)
  (cons lower upper))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

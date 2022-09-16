(define (div-interval x y)
  (if (= 0 (midpoint y))
      #f
      (mul-interval x
		    (make-interval
		     (/ 1.0 (upper-bound y))
		     (/ 1.0 (lower-bound y))))))

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

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (midpoint x)
  (/ (+ (lower-bound x) (upper-bound x)) 2))

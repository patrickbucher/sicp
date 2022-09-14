(define (sub-interval x y)
  (make-interval (- (lower-bound x)
		    (upper-bound y))
		 (- (upper-bound x)
		    (lower-bound y))))

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

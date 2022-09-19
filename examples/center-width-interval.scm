(define (make-center-width c w)
  (make-interval (- c w)
		 (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.))

(define (width i)
  (/ (- (lower-bound i) (upper-bound i)) 2.))

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

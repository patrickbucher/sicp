(define (mul-interval a b)
  (let ((dc (mul-delta (percent a) (percent b)))
	(va (center a))
	(vb (center b)))
    (display dc)
    (newline)
    (make-center-percent (* va vb) (* 100 dc))))

(define (mul-delta da db)
  (+ da db (* da db)))

(define (make-center-percent c p)
  (let ((f (/ p 100.)))
    (make-interval (- c (* c f))
		   (+ c (* c f)))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.))

(define (percent i)
  (* (/ (width i) (center i)) 100.))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.))

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

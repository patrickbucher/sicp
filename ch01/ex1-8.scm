(define (qbrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (qbrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 1e-3))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (qbrt x)
  (qbrt-iter 1.0 x))

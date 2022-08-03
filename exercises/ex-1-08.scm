(define (cube-root-iter guess x)
  (if (good-enough? guess
		    (improve guess x)
		    x)
      guess
      (cube-root-iter (improve guess x)
		      x)))

(define (good-enough? old new x)
  (< (abs (- new old)) (* x 1e-6)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x)
  (* x x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

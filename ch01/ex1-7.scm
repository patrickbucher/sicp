; Answer: For very large numbers, a difference of 0.001 does hardly matter. For
; very small numbers, however, a difference of 0.001 might matter a lot, for
; the difference might be larger than the result itself. The square root of
; 1e-6 is 0.001, for example, which is equal to the delta being tested.

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
    guess
    (sqrt-iter (improve guess x) x)))

; This implementation scales better towards different magnitudes of numbers.
; However, it requires the guess to be calculated twice, which is less
; efficient.
(define (good-enough? last-guess guess)
  (< (abs (- last-guess guess)) (/ last-guess 1e9)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

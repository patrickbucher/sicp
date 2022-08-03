(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; For a very large number, the difference of 1e-3 is way too fine-grained.
;; For a very small number, the difference of 1e-3 is not sufficient.
;; It's better too pick a difference in proportion to the input x.
(define (sqrt-iter old-guess x)
  (if (good-enough? old-guess
		    (improve old-guess x)
		    x)
      old-guess
      (sqrt-iter (improve old-guess x)
		 x)))

(define (good-enough? old-guess new-guess x)
  (< (abs (- old-guess new-guess)) (* new-guess 1e-6)))
;; This test works better on very large and very small numbers, because the
;; delta is tested in proportion to the input argument 

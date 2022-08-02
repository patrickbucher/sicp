(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;; Both then-clause and else-clause are evaluated eagerly (applicative-order evaluation).
;; The else-clause calls sqrt-iter, which calls itself recursively ad infinitum.
;; The program is stuck, and possibly causes a stack overflow.
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))
					; Aborting!: maximum recursion depth exceeded!

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Answer: With this new-if clause, maximum recursion depth is reached. The
; problem is that this if clause evaluates all arguments, including the
; then-clause and else-clause. The else-clause causes the interpreter to
; evaluate the next iteration (improving the guess).

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; from newton-sqrt.scm
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

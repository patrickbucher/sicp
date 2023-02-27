(load "lib/concurrency.rkt")

(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
		  (lambda () (set! x (+ x 1))))

(display x)
(newline)
;; 121

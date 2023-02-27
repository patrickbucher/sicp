(load "lib/concurrency.rkt")

(define x 10)

(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
		  (s (lambda () (set! x (+ x 1)))))

(display x)
(newline)

;; The computations won't be interrupted, but the order of the
;; computations is still not deterministic.

;; 1) P2 increments x, P1 squares it -> 121
;; 2) P1 squares x, P2 increments it -> 101
;; 3) P1 starts, P2 increments x, P1 overwrites it with the square -> 100


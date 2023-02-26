(load "lib/parallel-execute.rkt")
(load "lib/serializer.rkt")

(define x 10)

(define s (make-serializer))

(parallel-execute (s (lambda () (set! x (* x x))))
		  (s (lambda () (set! x (+ x 1)))))

(display x)
(newline)

(define (timed-prime-test n times start-time)
  (newline)
  (display "Fermat Test for ")
  (display n)
  (display " with ")
  (display times)
  (display " iterations, result: ")
  (display (fast-prime? n times))
  (display ", time: ")
  (display (- (runtime) start-time))
  (display " sec."))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n)
	 (fast-prime? n (- times 1)))
	(else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod base (- exp 1) m))
	  m))))

;; tests: 1
;; 22815088913: 0.0
;; 87178291199: 0.0
;; 3314192745739: 0.0
;; 10888869450418352160768000001: 0.0
;; 263130836933693530167218012159999999: 0.0

;; tests: 100
;; 22815088913: 0.02
;; 87178291199: 0.02
;; 3314192745739: 0.02
;; 10888869450418352160768000001: 0.04
;; 263130836933693530167218012159999999: 0.06

;; tests: 10000
;; 22815088913: 0.58
;; 87178291199: 0.66
;; 3314192745739: 0.6
;; 10888869450418352160768000001: 1.55
;; 263130836933693530167218012159999999: 2.3

;; The measured run-time indicates that the second parameter (times,
;; denoting the number of tests to be run) is more significant than
;; the number (n) to be tested.

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime)
		       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
	 n)
	((divides? test-divisor n)
	 test-divisor)
	(else (find-divisor
	       n
	       (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; (timed-prime-test 3314192745739)
;; 1.75

(define (search-for-primes lower upper)
  (cond ((>= lower upper) (display "no primes found"))
	((odd? lower) (do-prime-test lower upper))
	(else (search-for-primes (+ lower 1) upper))))

(define (do-prime-test n upper)
  (timed-prime-test n)
  (search-for-primes (+ n 1) upper))

;; (search-for-primes 1000 1050)
;; 1009 *** 0.
;; 1013 *** 0.
;; 1019 *** 0.
;; (search-for-primes 10000 10050)
;; 10007 *** 0.
;; 10009 *** 0.
;; 10037 *** 0.
;; (search-for-primes 100000 100100)
;; 100003 *** 0.
;; 100019 *** 0.
;; 100043 *** 0.
;; (search-for-primes 1000000 1000050)
;; 1000003 *** 0.
;; 1000033 *** 1.0000000000000009e-2
;; 1000037 *** 0.
;; Current computers are way too fast to reason about the runtime in those ranges.


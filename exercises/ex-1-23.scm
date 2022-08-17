(define (timed-smallest-divisor n start-time)
  (newline)
  (display "Smallest divisor of n=")
  (display n)
  (display " is ")
  (display (smallest-divisor n))
  (display ", found after ")
  (display (- (runtime) start-time))
  (display " sec."))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
	 n)
	((divides? test-divisor n)
	 test-divisor)
	(else (find-divisor
	       n
	       (next test-divisor)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

;; timings (unoptimized)
;; (timed-smallest-divisor 22815088913 (runtime))
;; Smallest divisor of n=22815088913 is 22815088913, found after .17999999999999972 sec.
;; (timed-smallest-divisor 87178291199 (runtime))
;; Smallest divisor of n=87178291199 is 87178291199, found after .31000000000000005 sec.
;; (timed-smallest-divisor 3314192745739 (runtime))
;; Smallest divisor of n=3314192745739 is 3314192745739, found after 1.6899999999999977 sec.

;; timings (optimized)
;; (timed-smallest-divisor 22815088913 (runtime))
;; Smallest divisor of n=22815088913 is 22815088913, found after .12999999999999545 sec.
;; (timed-smallest-divisor 87178291199 (runtime))
;; Smallest divisor of n=87178291199 is 87178291199, found after .1700000000000017 sec.
;; (timed-smallest-divisor 3314192745739 (runtime))
;; Smallest divisor of n=3314192745739 is 3314192745739, found after 1.0700000000000003 sec.

;; The optimized version requires 72%, 55%, and 63%, respectively, of the time the
;; unoptimized version requires. The speedup is between one third and one half.
;; The speedup is less than 50%, because the procedure has some overhead.

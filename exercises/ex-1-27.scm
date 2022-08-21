(define (fermat-test n)
  (full-fermat-test n 2))

(define (full-fermat-test n i)
  (cond ((= i n) #t)
	((= (expmod i n n) i) (full-fermat-test n (+ i 1)))
	(else #f)))

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

(define (prime? n)
  (full-prime-check n 2))

(define (full-prime-check n i)
  (cond ((>= i n) #t)
	((= (remainder n i) 0) #f)
	(else (full-prime-check n (+ i 1)))))

;; Carmichael numbers: 561, 1105, 1729, 2465, 2821, 6601
;; (fermat-test 561)  #t  (prime? 561)  #f
;; (fermat-test 1105) #t  (prime? 1105) #f
;; (fermat-test 1729) #t  (prime? 1729) #f
;; (fermat-test 2465) #t  (prime? 2465) #f
;; (fermat-test 2821) #t  (prime? 2821) #f
;; (fermat-test 6601) #t  (prime? 6601) #f

(define (print-carmichael-numbers-in-range a b)
  (cond ((>= a b) (display "done"))
	((carmichael? a) (report-carmichael-number a b))
	(else (print-carmichael-numbers-in-range (+ a 1) b))))

(define (report-carmichael-number a b)
  (display a)
  (newline)
  (print-carmichael-numbers-in-range (+ a 1) b))

(define (carmichael? n)
  (and (fermat-test n) (not (prime? n))))

;; (print-carmichael-numbers-in-range 1 10000)
;; 561
;; 1105
;; 1729
;; 2465
;; 2821
;; 6601
;; 8911
;; done

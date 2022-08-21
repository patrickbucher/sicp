(define (miller-rabin-test n)
  (do-miller-rabin-test n (rand 1 n)))

(define (do-miller-rabin-test n a)
  (= (expmod a (- n 1) n) 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square
	   (nontrivial-square-root-of-1-modulo-n?
	    (expmod base (/ exp 2) m)
	    m))
	  m))
	(else
	 (remainder
	  (* base
	     (expmod base (- exp 1) m))
	  m))))

;; returns a random number in range [a;b[
(define (rand a b)
  (+ (random (- b a)) a))
      
;; "x is congruent to 1 modulo n"
(define (congruent-to-1-modulo-n? x n)
  (= (remainder x n) 1))

;; "nontrivial square root of 1 modulo n"
;; returns 0 if x is a nontrivial square root of 1 modulo n
;; returns x otherwise
(define (nontrivial-square-root-of-1-modulo-n? x n)
  (cond ((= x 1) x)
	((= x (- n 1)) x)
	((congruent-to-1-modulo-n? (square x) n) 0)
	(else x)))

;; test with Carmichael numbers
;; (miller-rabin-test 561)  #f
;; (miller-rabin-test 1105) #f
;; (miller-rabin-test 1105) #f
;; (miller-rabin-test 1729) #f
;; (miller-rabin-test 2465) #f
;; (miller-rabin-test 2821) #f
;; (miller-rabin-test 6601) #f
;; (miller-rabin-test 8911) #f

;; test with some big prime numbers
;; (miller-rabin-test 22815088913)                          #t
;; (miller-rabin-test 87178291199)                          #t
;; (miller-rabin-test 3314192745739)                        #t
;; (miller-rabin-test 10888869450418352160768000001)        #t
;; (miller-rabin-test 263130836933693530167218012159999999) #t

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


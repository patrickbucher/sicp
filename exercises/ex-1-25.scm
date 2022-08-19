(define (expmod-old base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod-old base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base (expmod-old base (- exp 1) m))
	  m))))

(define (expmod-new base exp m)
  (remainder (fast-expt 1 base exp) m))

(define (fast-expt a b n)
  (cond ((= n 1) (* a b))
	((odd? n)
	 (fast-expt (* a b) b (- n 1)))
	(else
	 (fast-expt a (* b b) (/ n 2)))))

;; Example: base=7, exp=3, m=6

;; (expmod-old 7 3 6)
;; (remainder (* 7 (expmod-old 7 2 6) 6))
;; (remainder (* 7 (remainder (square (expmod-old 7 1 6)) 6)) 6)
;; (remainder (* 7 (remainder (square (remainder (* 7 (expmod-old 7 0 6)) 6)) 6)) 6)
;; (remainder (* 7 (remainder (square (remainder (* 7 1) 6)) 6)) 6)
;; (remainder (* 7 (remainder (square (remainder 7 6)) 6)) 6)
;; (remainder (* 7 (remainder (square 1) 6)) 6)
;; (remainder (* 7 (remainder 1 6)) 6)
;; (remainder (* 7 1) 6)
;; (remainder 7 6)
;; 1

;; (expmod-new 7 3 6)
;; (remainder (fast-expt 1 7 3) 6)
;; (remainder (fast-expt 7 7 2) 6)
;; (remainder (fast-expt 7 49 1) 6)
;; (remainder 343 6)
;; 1

;; The implementation based on fast-expt requires less steps and less space, but has to deal with bigger numbers.

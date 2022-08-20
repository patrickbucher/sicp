;; new implementation: using multiplication
(define (expmod-new base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (* (expmod-new base (/ exp 2) m)
	     (expmod-new base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base
	     (expmod-new base (- exp 1) m))
	  m))))

;; old implementation: 
(define (expmod-old base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder
	  (square (expmod-old base (/ exp 2) m))
	  m))
	(else
	 (remainder
	  (* base
	     (expmod-old base (- exp 1) m))
	  m))))

;; Example:
;; base=2, exp=8, m=3

;; (expmod-new 2 8 3)
;; (remainder (* (expmod-new 2 4 3)
;;               (expmod-new 2 4 3))
;;            m)
;; (remainder (* (remainder (* (expmod-new 2 2 3)
;;                             (expmod-new 2 2 3))
;;                          m)
;;               (remainder (* (expmod-new 2 2 3)
;;                             (expmod-new 2 2 3))
;;                          m)))
;;
;; -> Using multiplication instead of square, two functions are called per step!

;; (expmod-old 2 8 3)
;; (remainder (square (expmod-old 2 4 3)) m)
;; (remainder (square (remainder (square (expmod-old 2 2 3)) m)) m)
;;
;; -> Using square, only one expmod procedure call is spawned per step.

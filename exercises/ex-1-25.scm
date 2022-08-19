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

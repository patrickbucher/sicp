(define (expt b n)
  (cond ((= n 0) 1)
	((= n 1) b)
	(else (fast-expt 1 b n))))

(define (fast-expt a b n)
  (cond ((= n 1) (* a b))
	((odd? n)
	 (fast-expt (* a b) b (- n 1)))
	(else
	 (fast-expt a (* b b) (/ n 2)))))

(define (odd? n)
  (= (remainder n 2) 1))

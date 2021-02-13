(define (pascal r c)
  (cond ((<= r 1) 1)
	((or (= c 0) (= c r)) 1)
	(else (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))))

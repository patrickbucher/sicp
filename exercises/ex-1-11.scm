(define (f-rec n)
  (cond ((< n 3) n)
	(else (+ (f-rec (- n 1))
		 (* 2 (f-rec (- n 2)))
		 (* 3 (f-rec (- n 3)))))))

(define (f-iter n)
  (if (< n 3)
      n
      (f-iter-int n 0 1 2)))

(define (f-iter-int n y-3 y-2 y-1)
  (if (< n 3)
      y-1
      (f-iter-int (- n 1)
		  y-2
		  y-1
		  (+ y-1 (* 2 y-2) (* 3 y-3)))))
			  

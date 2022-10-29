(define (fib n)
  (cond ((= n 0) 1)
	((= n 1) 2)
	(else (+ (fib (- n 2)) (fib (- n 1))))))

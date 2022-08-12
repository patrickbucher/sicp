(define (mul a b)
  (cond ((= a 0) 0)
	((= b 0) 0)
	((= a 1) b)
	((= b 1) a)
	((even? b)
	 (double (mul a (halve b))))
	(else
	 (+ a (mul a (dec b))))))

(define (dec x)
  (- x 1))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

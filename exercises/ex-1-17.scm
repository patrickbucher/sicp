(define (mul a b)
  (cond ((= a 0) 0)
	((= b 0) 0)
	((= a 1) b)
	((= b 1) a)
	(else (fast-mul a b
			(if (even? b) a 0))))) ; neutral element depends on first operation

(define (fast-mul a b acc)
  (cond ((= b 0) acc)
	((even? b) (fast-mul a (halve b) (double acc)))
	(else (fast-mul a (- b 1) (+ acc a)))))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

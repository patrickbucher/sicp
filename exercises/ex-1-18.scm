(define (mul a b)
  (cond ((= a 0) 0)
	((= b 0) 0)
	((= a 1) b)
	((= b 1) a)
	(else (fast-mul a a (dec b) a))))

(define (fast-mul a a-acc b sum-acc)
  (cond ((= b 0) sum-acc)
	((even? b) (fast-mul a (double a-acc) (halve b) sum-acc))
	(else (fast-mul a a-acc (dec b) (+ sum-acc a-acc)))))

(define (dec x)
  (- x 1))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (times-factor-of x n)
  (define (next y i)
    (if (= 0 (remainder y n))
	(next (/ y n) (+ i 1))
	i))
  (next x 0))

(define (exp x n)
  (define (next y i)
    (if (= i 1)
	y
	(next (* y x) (- i 1))))
  (next x n))

(define (cons a b)
  (* (exp 2 a) (exp 3 b)))

(define (car x)
  (times-factor-of x 2))

(define (cdr x)
  (times-factor-of x 3))

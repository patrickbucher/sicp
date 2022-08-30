(define (cont-frak-iter n d k)
  (define (next-frak i result)
    (if (> i k)
	result
	(next-frak (+ i 1) (/ (n i) (+ (d i) result)))))
  (next-frak 1 0))

(define (d i)
  (if (= (remainder i 3) 2)
      (- i (floor (/ i 3)))
      1))

(define (test-d k)
  (define (show i)
    (display "i=")
    (display i)
    (display ", Di=")
    (display (d i))
    (newline)
    (next (+ i 1)))
  (define (next i)
    (if (< i k)
	(show i)
	1))
  (next 1))
  
(define (eulers-number k)
  (+
   2.
   (cont-frak-iter (lambda (i) 1)
		   (lambda (i) (d i))
		   k)))

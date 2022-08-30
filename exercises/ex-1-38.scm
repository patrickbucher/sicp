(define (cont-frak n d k)
  (define (next-frak i)
    (if (> i k)
	0
	(/ (n i) (+ (d i) (next-frak (+ i 1))))))
  (next-frak 1))

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
   (cont-frak (lambda (i) 1)
	      (lambda (i) (d i))
	      k)))

;; (eulers-number 3) 2.75
;; (eulers-number 4) 2.7142857142857144
;; (eulers-number 9) 2.718283582089552
;; (eulers-number 20) 2.718281828459045

(define (approx-eulers-number k)
  (define (show i)
    (display "iteration: ")
    (display i)
    (display ", e=")
    (display (eulers-number i))
    (newline)
    (next (+ i 1)))
  (define (next i)
    (if (> i k)
	(display "done")
	(show i)))
  (next 1))

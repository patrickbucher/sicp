; recursive
(define (f n)
  (cond ((<= n 3) 3)
	(else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; iterative
(define (f2 n)
  (f-iter 3 3 3 3 n))

(define (f-iter a b c d n)
  (cond ((<= n 0) d)
	(else (f-iter (+ a (* 2 b) (* 3 c)) a b c (- n 1)))))

(define (cont-frak n d k)
  (define (next-frak i)
    (if (> i k)
	0
	(/ (n i) (+ (d 1) (next-frak (+ i 1))))))
  (next-frak 1))

(define (golden-ratio k)
  (/ 1 (cont-frak (lambda (i) 1.0)
		  (lambda (i) 1.0)
		  k)))

(define (close-enough? x)
  (< (abs (- x 1.61803398875)) 0.0001))

(define (find-close-enough-k)
  (define (try i)
    (if (close-enough? (golden-ratio i))
	i
	(try (+ i 1))))
  (try 1))

;; (find-close-enough-k)
;; 11
;; (golden-ratio 10)
;; 1.6181818181818184
;; (golden-ratio 11)
;; 1.6179775280898876

(define (cont-frak-iter n d k)
  (define (next-frak i result)
    (if (> i k)
	result
	(next-frak (+ i 1) (/ (n i) (+ (d i) result)))))
  (next-frak 1 0))

(define (golden-ratio-iter k)
  (/ 1 (cont-frak-iter (lambda (i) 1.0)
		       (lambda (i) 1.0)
		       k)))

;; (golden-ratio-iter 10)
;; 1.6181818181818184
;; (golden-ratio-iter 11)
;; 1.6179775280898876
;; (golden-ratio-iter 1000000)
;; 1.618033988749895
;; (golden-ratio 1000000)
;; maximum recursion depth exceeded

(define (repeated f n)
  (define (next i)
    (if (= i 1)
	f
	(compose f (next (- i 1)))))
  (next n))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (+ x 1))

(define (twice x) (* x 2))

(define (repeated-iter f n)
  (define (next i g)
    (if (= i 1)
	g
	(next (- i 1) (compose f g))))
  (next n f))

;; ((repeated inc 3) 0)
;; 3
;; ((repeated twice 10) 1)
;; 1024

;; ((repeated-iter inc 3) 0)
;; 3
;; ((repeated-iter twice 10) 1)
;; 1024

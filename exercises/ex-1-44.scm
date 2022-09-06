(define dx 0.01)

(define (smooth f)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth f n)
  (repeated f n))

(define (repeated f n)
  (define (next g i)
    (if (= i 1)
	g
	(next (smooth f) (- i 1))))
  (next f n))

;; ((smooth cos) 90)
;; -.4480586804664303
;; ((n-fold-smooth cos 1) 90)
;; -.4480736161291701
;; ((n-fold-smooth cos 10) 90)
;; -.4480586804664303


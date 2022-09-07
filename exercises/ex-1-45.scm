(define tolerance 0.001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define (repeated f n)
  (define (next g i)
    (if (= i 1)
	g
	(next (smooth f) (- i 1))))
  (next f n))

(define dx 0.001)

(define (smooth f)
  (define (average a b c)
    (/ (+ a b c) 3))
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (square-root x)
  (fixed-point (average-damp (lambda (y) (* (/ 1 2)
					    (+ y (/ x y)))))
	       1.0))

;; (square-root 16)
;; 4.000870090097061

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (* (/ 1 2)
					    (+ y (/ x (* y y))))))
	       1.0))

;; (cube-root 64)
;; 4.00009968985985

(define (fourth-root x)
  (fixed-point (repeated (average-damp (lambda (y) (* (/ 1 2)
						      (+ y (/ x (* y y y))))))
			 1)
	       1.0))

;; (fourth-root 256)
;; 4.000000380085221

(define (fifth-root x)
  (fixed-point (repeated (average-damp (lambda (y) (* (/ 1 2)
						      (+ y (/ x (* y y y y))))))
			 1)
	       1.0))

;; (fifth-root 1024)
;; 3.9999317321006225
;; (fifth-root 100000)
;; 10.000083709666665

;; one repetition seems to be enough...

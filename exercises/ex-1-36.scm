(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "guess: ")
      (display guess)
      (newline)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (golden-ratio)
  (fixed-point
   (lambda (x) (+ 1 (/ 1 x)))
   2.0))

;; (golden-ratio)
;; guess: 2.
;; guess: 1.5
;; guess: 1.6666666666666665
;; guess: 1.6
;; guess: 1.625
;; guess: 1.6153846153846154
;; guess: 1.619047619047619
;; guess: 1.6176470588235294
;; guess: 1.6181818181818182
;; guess: 1.6179775280898876
;; guess: 1.6180555555555556
;; guess: 1.6180257510729614
;; guess: 1.6180371352785146
;; 1.6180327868852458

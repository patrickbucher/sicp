(define (iterative-improve good-enough? improve)
  (define (iterate guess)
    (if (good-enough? guess)
	guess
	(iterate (improve guess))))
  iterate)

(define (find-secret-number lower upper)
  (let ((secret-number (+ (random (- upper lower)) lower)))
    (display "guessed a secret number: ")
    (display secret-number)
    (newline)
    (define (match? guess)
      (display "match? ")
      (display guess)
      (newline)
      (= guess secret-number))
    (define (approach guess)
      (if (< guess secret-number)
	  (+ guess 1)
	  (- guess 1)))
    ((iterative-improve match? approach) (floor (/ (+ upper lower) 2)))))

;; (find-secret-number 1 10)
;; guessed a secret number: 8
;; match? 5
;; match? 6
;; match? 7
;; match? 8
;; 8

(define (sqrt-iter guess x)
  (define (good-enough? g)
    (< (abs (- (* g g) x)) 0.001))
  (define (improve g)
    (/ (+ g (/ x g)) 2))
  ((iterative-improve good-enough? improve) guess))

;; (sqrt-iter 1.0 64)
;; 8.000001655289593

(define (fixed-point f first-guess)
  (define (close-enough? g)
    (< (abs (- g (f g))) 0.001))
  (define (improve g)
    (f g))
  ((iterative-improve close-enough? improve) first-guess))

;; (fixed-point cos 1.0)
;; .7395672022122561

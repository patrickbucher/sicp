(load "lib/rand.scm")

(define (estimate-pi trials)
  (sqrt (/ 6 (random-gcd-test trials random-init))))

(define (random-gcd-test trials initial-x)
  (define (iter trials-remaining trials-passed x)
    (let ((x1 (rand-update x)))
      (let ((x2 (rand-update x1)))
	(cond ((= trials-remaining 0)
	       (/ trials-passed trials))
	      ((= (gcd x1 x2) 1)
	       (iter (- trials-remaining 1)
		     (+ trials-passed 1)
		     x2))
	      (else
	       (iter (- trials-remaining 1)
		     trials-passed
		     x2))))))
  (iter trials 0 initial-x))

;; (estimate-pi 10)
;; 5.477225575051661
;; (estimate-pi 100)
;; 2.9925280083228984
;; (estimate-pi 1000)
;; 3.123475237772121
;; (estimate-pi 10000)
;; 3.1471032444610803

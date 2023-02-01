(load "lib/math.scm") ;; pow
(load "lib/monte-carlo.scm") ;; monte-carlo
(load "lib/rand.scm") ;; random-in-range

(define (new-in-circle-predicate cx cy r)
  (lambda (x y)
    (<= (+ (pow (- x cx) 2)
	   (pow (- y cy) 2))
	(pow r 2))))

(define in-circle? (new-in-circle-predicate 5. 7. 3.))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
	  (y (random-in-range y1 y2)))
      (P x y)))
  (let ((ratio (monte-carlo trials experiment)))
    (* ratio 4.0)))

;; (estimate-integral in-circle? 2. 8. 4. 10. 10)
;; 3.6
;; (estimate-integral in-circle? 2. 8. 4. 10. 100)
;; 3.28
;; (estimate-integral in-circle? 2. 8. 4. 10. 1000)
;; 3.172
;; (estimate-integral in-circle? 2. 8. 4. 10. 1e4)
;; 3.1404
;; (estimate-integral in-circle? 2. 8. 4. 10. 1e5)
;; 3.15288
;; (estimate-integral in-circle? 2. 8. 4. 10. 1e6)
;; 3.14022

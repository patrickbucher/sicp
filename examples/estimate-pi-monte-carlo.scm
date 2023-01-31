(load "lib/rand.scm")
(load "lib/monte-carlo.scm")

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

;; (estimate-pi 10)
;; 2.581988897471611
;; (estimate-pi 100)
;; 10/3
;; (estimate-pi 1000)
;; 3.09344112444873
;; (estimate-pi 10000)
;; 3.1476228685452723

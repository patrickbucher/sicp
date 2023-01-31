(define a 75)
(define b 74)
(define m 1e3)
(define random-init 37)

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (rand-update x)
  (remainder (+ (* a x) b) m))

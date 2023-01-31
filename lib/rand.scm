(define random-init 13)
(define a 3)
(define b 7)
(define m 100)

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (rand-update x)
  (remainder (+ (* a x) b) m))

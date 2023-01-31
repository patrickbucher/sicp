(define random-init (random 50))

(define (rand-update x) (random 100))

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

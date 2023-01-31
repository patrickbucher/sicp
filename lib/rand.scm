(define lower-bound 0)
(define upper-bound 99)

(define (rand-update x) (+ (random (+ (- upper-bound lower-bound) 1)) lower-bound))

(define random-init (rand-update -1))

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

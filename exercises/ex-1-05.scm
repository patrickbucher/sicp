(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p)) ; does not halt

;; applicative-order evaluation
(test 0 (p))
(test 0 (p))
;; this expression always evaluates to itself

;; normal-order evaluation
(test 0 (p))
(if (= 0 0)
    0
    (p))
0
;; this expression never evaluates (p)

;; Since the expression does not halt, applicative-order evaluation is used!

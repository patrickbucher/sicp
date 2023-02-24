(load "lib/constraints.scm")

(define a (make-connector))
(define b (make-connector))
(set-value! a 10 'user)

;; (for-each-except setter inform-about-value constraints)

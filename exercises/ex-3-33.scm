(load "lib/constraints.scm")

(define (averager a b c)
  (let ((a-plus-b (make-connector))
	(twice-c (make-connector))
	(two (make-connector))
	(left-eq-right (make-connector)))
    (adder a b a-plus-b)
    (multiplier two c a-plus-b)
    (constant 2 two)
    'ok))

(define A (make-connector))
(define B (make-connector))
(define C (make-connector))
(averager A B C)

(probe 'A A)
(probe 'B B)
(probe 'C C)

(set-value! A 12 'user)
(set-value! B 18 'user)
;; Probe: a = 12
;; Probe: b = 18
;; Probe: c = 15

(forget-value! A 'user)
;; Probe: a = ?
;; Probe: c = ?

(set-value! C 20 'user)
;; Probe: c = 20
;; Probe: a = 22

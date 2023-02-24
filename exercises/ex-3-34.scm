(load "lib/constraints.scm")

(define (squarer a b)
  (multiplier a a b))

(define A (make-connector))
(define B (make-connector))
(squarer A B)

(probe 'A A)
(probe 'B B)

(set-value! A 3 'user)
;; Probe: a = 3
;; Probe: b = 9

(forget-value! A 'user)
;; Probe: a = ?
;; Probe: b = ?

(set-value! B 16 'user)
;; Probe: b = 16

;; This constraint only works in one direction.

(define (new-squarer a b c)
  (multiplier a b c))

(define X (make-connector))
(define Y (make-connector))
(define Z (make-connector))
(new-squarer X Y Z)

(probe 'X X)
(probe 'Y Y)
(probe 'Z Z)

(set-value! X 3 'user)
(set-value! Y 3 'user)
;; Probe: x = 3
;; Probe: y = 3
;; Probe: z = 9

(forget-value! X 'user)
(forget-value! Y 'user)
(forget-value! Z 'user)

(set-value! Z 16 'user)
;; no answer

(load "lib/digital-circuits.scm")

(define (new-or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-not (logical-and (logical-not (get-signal a1))
					       (logical-not (get-signal a2))))))
      (after-delay (+ (* 2 inverter-delay) and-gate-delay)
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define a (make-wire))
(define b (make-wire))
(define o (make-wire))

(new-or-gate a b o)

(probe 'o o)

(set-signal! a 0)
(propagate)
(set-signal! b 0)
(propagate)
(set-signal! a 1)
(propagate)
(set-signal! b 1)
(propagate)

(load "lib/digital-circuits.scm")

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1)
				  (get-signal a2))))
      (after-delay or-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define (logical-or a b)
  (cond ((or (= a 1) (= b 1)) 1)
	((and (= a 0) (= b 0)) 0)
	(else (error "invalid signal a" a "b" b))))

(define a (make-wire))
(define b (make-wire))
(define o (make-wire))

(or-gate a b o)

(probe 'o o)

(set-signal! a 0)
(propagate)
(set-signal! b 0)
(propagate)
(set-signal! a 1)
(propagate)
(set-signal! b 1)
(propagate)

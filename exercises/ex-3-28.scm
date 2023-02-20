(load "lib/circuits.scm")

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

;; (define a (make-wire))
;; (define b (make-wire))
;; (define o (make-wire))

;; (set-signal! a 0)
;; (set-signal! b 0)
;; (get-signal o)
;; 0

;; (set-signal! a 0)
;; (set-signal! b 1)
;; (get-signal o)
;; 0
;; This is wrong, FIXME!
;; The `or-action-procedure` is never run, otherwise the missing `logical-or` would fail.

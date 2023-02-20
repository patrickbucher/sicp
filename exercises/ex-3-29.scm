(load "lib/circuits.scm")

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-not (logical-and (logical-not a1)
					       (logical-not a2)))))
      (after-delay (+ (2 * inv-gate-delay) and-gate-delay)
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

;; TODO: test, after code for ex-3-28.scm is working.

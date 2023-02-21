;; Timing: A full adder has a delay of two times a half adder plus a
;; or gate: t_fa = 2 * t_ha + t_or

;; A half adder has a delay of the maximum of either an or gate, or,
;; an and gate, combined with the invert gate, plus an and gate:
;; t_ha = max(t_or, [t_and + t_inv]) + t_and

;; A ripple carry adder combines n full adders:
;; t_fa = n(2 * t_ha + t_or) = n[2(max(t_on, {t_and + t_inv}) + t_and)]

(load "lib/circuits.scm")

(define (half-adder a b s c)
  (let ((d (make-wire))
	(e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter e e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
  (let ((c1 (make-wise))
	(c2 (make-wise))
	(s (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder as bs ss c)
  ;; TODO
  )

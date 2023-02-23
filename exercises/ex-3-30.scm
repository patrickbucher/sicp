;; Timing: A full adder has a delay of two times a half adder plus a
;; or gate: t_fa = 2 * t_ha + t_or

;; A half adder has a delay of the maximum of either an or gate, or,
;; an and gate, combined with the invert gate, plus an and gate:
;; t_ha = max(t_or, [t_and + t_inv]) + t_and

;; A ripple carry adder combines n full adders:
;; t_fa = n(2 * t_ha + t_or) = n[2(max(t_on, {t_and + t_inv}) + t_and)]

(load "lib/circuits.scm")

(define (ripple-carry-adder as bs ss c)
  ;; TODO
  )

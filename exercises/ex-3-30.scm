;; Timing: A full adder has a delay of two times a half adder plus a
;; or gate: t_fa = 2 * t_ha + t_or

;; A half adder has a delay of the maximum of either an or gate, or,
;; an and gate, combined with the invert gate, plus an and gate:
;; t_ha = max(t_or, [t_and + t_inv]) + t_and

;; A ripple carry adder combines n full adders:
;; t_fa = n(2 * t_ha + t_or) = n[2(max(t_on, {t_and + t_inv}) + t_and)]

(load "lib/digital-circuits.scm")

(define (ripple-carry-adder as bs c-in ss c-out)
  (cond ((not (= (length as) (length bs) (length ss))) (error "different lengths of inputs"))
	((or (null? as) (null? bs) (null? ss)) 'ok)
	(else
	 (let ((c (if (null? (cdr ss)) c-out (make-wire))))
	   (full-adder (car as)
		       (car bs)
		       c-in
		       (car ss)
		       c)
	   (ripple-carry-adder (cdr as) (cdr bs) c (cdr ss) c-out)))))

(define a0 (make-wire))
(define a1 (make-wire))
(define a2 (make-wire))

(define b0 (make-wire))
(define b1 (make-wire))
(define b2 (make-wire))

(define s0 (make-wire))
(define s1 (make-wire))
(define s2 (make-wire))

(define c-in (make-wire))
(define c-out (make-wire))

(ripple-carry-adder (list a0 a1 a2)
		    (list b0 b1 b2)
		    c-in
		    (list s0 s1 s2)
		    c-out)

(probe 's0 s0)
(probe 's1 s1)
(probe 's2 s2)
(probe 'c-out c-out)

(set-signal! a0 0)
(set-signal! a1 0)
(set-signal! a2 1)
(set-signal! b0 1)
(set-signal! b1 1)
(set-signal! b2 1)
(propagate)

;;   100
;; + 111
;; -----
;;  1011


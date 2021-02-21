(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

; a)
;
; (sine 12.15)
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.05))))))
; (p (p (p (p .14950000000000002))))
; (p (p (p .4351345505)))
; (p (p .9758465331678772))
; (p -.7895631144708228)
; (p -.39980345741334)
;
; p is applied five times.

; b) growth rate: n/3 => n (one additional invocation of p as n triples)

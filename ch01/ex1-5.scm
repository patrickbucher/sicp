(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

; 1) applicative order: (p) always evaluates to (p). The expression cannot be
; evaluated and leads into an infinite loop.

; 2) normal order: (p) doesn't have to be evaluated. The expression evaluates
; to zero.

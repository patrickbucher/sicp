;; If b is a positive number, the if expression returns +.
;; Otherwise, the if expression returns -.
;; The operator function returned from if is then used on the operands a and b.
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

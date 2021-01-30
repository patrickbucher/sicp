(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Depending on the value of b, the if form returns either the plus (b>0) or the
; minus (b<=0) operator. The absolute value of b is thereby taken by leaving b
; as it is (+) or by inverting it (-).

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

(define (twice x)
  (* x 2))

;; (double inc) increases by one twice
;; (double double) doubles twices, i.e. quadruples
;; (double (double double)) quadruples twice, i.e. times 16
;; (((double (double double)) inc) 5)
;; 21
;; 21 = 5 + 16

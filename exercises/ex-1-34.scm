(define (f g)
  (g 2))

;; (f square)
;; 4

;; (f (lambda (z) (* z (+ z 1))))
;; 6

;; (f f)
;; evaluation:
;; (f 2)
;; (2 2)
;; The object 2 is not applicable.
;; Functions can be passed as values, but numbers cannot be applied as functions.

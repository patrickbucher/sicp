(load "examples/generic-arithmetic.scm")

(define z (make-complex-from-real-imag 3 4))

;; z
;; (complex rectangular 3 . 4)
;; (magnitude z)
;; Unknown type: MAGNITUDE (complex rectangular 3 . 4)

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

(define (magnitude z)
  (apply-generic 'magnitude z))

;; (magnitude z)
;; 5

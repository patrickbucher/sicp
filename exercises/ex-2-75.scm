(define (make-from-mag-ang m a)
  (define (dispatch op)
    (cond ((eq? op 'real-part)
	   (* (cos a) m))
	  ((eq? op 'imag-part)
	   (* (sin a) m))
	  ((eq? op 'magnitude) m)
	  ((eq? op 'angle) a)
	  (else
	   (error "Unknown op: MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

;; (apply-generic 'real-part (make-from-mag-ang 5 20))
;; 2.0404103090669596
;; (apply-generic 'imag-part (make-from-mag-ang 5 20))
;; 4.564726253638138

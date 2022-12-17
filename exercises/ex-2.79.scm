(load "examples/generic-arithmetic.scm")

(define (equ? x y)
  (apply-generic 'equ x y))

(define (install-generic-equ)
  ;; internal procedures
  (define (denom x) (car x))
  (define (numer x) (cdr x))
  ;; interface to the rest of the system
  (put 'equ '(scheme-number scheme-number)
       (lambda (x y)
	 (= x y)))
  (put 'equ '(rational rational)
       (lambda (x y)
	 (and (= (denom x) (denom y))
	      (= (numer x) (numer y)))))
  (put 'equ '(complex complex)
       (lambda (x y)
	 (and (= (real-part x) (real-part y))
	      (= (imag-part x) (imag-part y)))))
  'done)

(install-generic-equ)

;; (equ? (make-scheme-number 3) (make-scheme-number 4))
;; #f
;; (equ? (make-scheme-number 4) (make-scheme-number 4))
;; #t

;; (equ? (make-rational 3 4) (make-rational 4 3))
;; #f
;; (equ? (make-rational 3 4) (make-rational 6 8))
;; #t

;; (equ? (make-complex-from-real-imag 3 4) (make-complex-from-real-imag 4 3))
;; #f
;; (equ? (make-complex-from-real-imag 3 4) (make-complex-from-real-imag 3 4))
;; #t

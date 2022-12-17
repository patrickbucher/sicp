(load "examples/generic-arithmetic.scm")

(define (=zero? x)
  (apply-generic 'zero x))

(define (install-generic-zero)
  ;; internal procedures
  (define (denom x) (car x))
  ;; interface to the rest of the system
  (put 'zero '(scheme-number)
       (lambda (x)
	 (= x 0)))
  (put 'zero '(rational)
       (lambda (x)
	 (= (denom x) 0)))
  (put 'zero '(complex)
       (lambda (x)
	 (= (magnitude x) 0)))
  'done)

(install-generic-zero)

;; (=zero? (make-scheme-number 3))
;; #t
;; (=zero? (make-scheme-number 0))
;; #f
;; (=zero? (make-rational 3 4))
;; #f
;; (=zero? (make-rational 0 4))
;; #t
;; (=zero? (make-complex-from-real-imag 2 3))
;; #f
;; (=zero? (make-complex-from-real-imag 0 0))
;; #t

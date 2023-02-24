(load "lib/constraints.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x)
    z))

(define (cv v)
  (let ((z (make-connector)))
    (constant v z)
    z))

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 0) (cv 5))
	  x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

(probe 'C C)
(probe 'F F)

(set-value! C 27 'user)
;; Probe: f = 32
;; Probe: c = 27


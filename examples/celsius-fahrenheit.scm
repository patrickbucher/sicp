(load "lib/constraints.scm")

(define (celsius-fahrenheit-converter c f)
  (let ((u (make-connector))
	(v (make-connector))
	(w (make-connector))
	(x (make-connector))
	(y (make-connector)))
    (multiplier c w u)
    (multiplier v x u)
    (adder v y f)
    (constant 9 w)
    (constant 5 x)
    (constant 32 y)
    'ok))

(define C (make-connector))
(define F (make-connector))
(celsius-fahrenheit-converter C F)

(probe 'C C)
(probe 'F F)

(set-value! C 27 'user)
;; Probe: c = 27
;; robe: f = 403/5

(forget-value! C 'user)
;; Probe: c = ?
;; Probe: f = ?

(set-value! F 100 'user)
;; Probe: f = 100
;; Probe: c = 340/9

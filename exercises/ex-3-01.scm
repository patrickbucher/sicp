(define (make-accumulator val)
  (lambda (inc)
    (begin (set! val (+ val inc))
	   val)))

(define A (make-accumulator 5))

;; (A 10)
;; 15
;; (A 10)
;; 25


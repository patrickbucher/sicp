(define accumulator 100)

(define (f x)
  (if (= x 0)
      (begin
	(set! accumulator (* accumulator 2))
	accumulator)
      (begin
	(set! accumulator (+ accumulator x))
	accumulator)))

;; (+ (f 0) (f 1))

;; left to right evaluation:
;; (+ 200 (f 1)), accumulator = 200
;; (+ 200 201), accumulator = 201
;; 401

;; right to left evaluation:
;; (+ (f 0) 101), accumulator = 101
;; (+ 202 101), accumulator = 202
;; 303

;; actual execution
;; (+ (f 0) (f 1))
;; 303

;; switch order to simulate left to right evaluation
;; (+ (f 1) (f 0))
;; 401

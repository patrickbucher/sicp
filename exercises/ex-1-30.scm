(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
  (iter a 0))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (square x) (* x x))

;; (sum identity 1 inc 10)
;; 55

;; (sum square 1 inc 10)
;; 385

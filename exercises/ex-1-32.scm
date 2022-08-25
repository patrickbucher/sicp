(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (term a)
       (accumulate combiner null-value term (next a) next b))))

(define (sum-range a b)
  (define (add-up x y)
    (+ x y))
  (define (increment x)
    (+ x 1))
  (define (identity x)
    x)
  (accumulate add-up 0 identity a increment b))

(define (prod-range a b)
  (define (multiply x y)
    (* x y))
  (define (increment x)
    (+ x 1))
  (define (identity x)
    x)
  (accumulate multiply 1 identity a increment b))

(define (factorial n)
  (prod-range 1 n))

(define (acc-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum-range-iter a b)
  (define (add-up x y) (+ x y))
  (define (increment x) (+ x 1))
  (define (identity x) x)
  (acc-iter add-up 0 identity a increment b))

(define (prod-range-iter a b)
  (define (multiply x y) (* x y))
  (define (increment x) (+ x 1))
  (define (identity x) x)
  (acc-iter multiply 1 identity a increment b))

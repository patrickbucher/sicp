(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (identity x) x)

(define (increment x) (+ x 1))

(define (factorial n)
  (product identity 1 increment n))

(define (term i)
  (cond ((even? i) (/ (+ 2 i) (+ 3 i)))
	((odd? i) (/ (+ 3 i) (+ 2 i)))))

(define (approx-pi n)
  (* 4.0 (product term 0 increment n)))

;; i: term
;; 0: 2/3
;; 1: 4/3 (4=2+i+1, 3=3+i-1)
;; 2: 4/5 (4=2+i, 5=3+i)
;; 3: 6/5 (6=2+i+1, 5=3+i-1)
;; 4: 6/7 (6=2+i, 7=3+i)

;; start with 2/3
;; for odd i: add 2 to the numerator
;; for even i: add 2 to the denominator

;; numerator:
;; - odd i: num = 2+i+1 = 3+i
;; - even i: num = 2+i
;; denominator:
;; - odd i: den = 3+i-1 = 2+i
;; - even i: den = 3+i

;; (approx-pi 0)
;; 0
;; (approx-pi 1)
;; 3.5555555555555554
;; (approx-pi 2)
;; 2.8444444444444446
;; (approx-pi 10)
;; 3.023170192001361
;; (approx-pi 100)
;; 3.1263793980429817
;; (approx-pi 1000)
;; 3.140026946105016
;; (approx-pi 10000)
;; 3.1414356249917024

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))

(define (approx-pi-iter n)
  (* 4.0 (product-iter term 0 increment n)))

;; (approx-pi-iter 10000)
;; 3.1414356249917024
;; (approx-pi-iter 100000)
;; 3.1415769461370178

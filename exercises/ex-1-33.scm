(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b )
	   result)
	  ((filter a)
	   (iter (next a) (combiner (term a) result)))
	  (else
	   (iter (next a) result))))
  (iter a null-value))

(define (prime? n)
  (define (divides? i)
    (= (remainder n i) 0))
  (define (check-prime i)
    (cond ((>= i n) #t)
	  ((divides? i) #f)
	  (else (check-prime (+ i 1)))))
  (if (< n 2)
      #f
      (check-prime 2)))

(define (sum-squared-primes a b)
  (define (square x) (* x x))
  (define (add x y) (+ x y))
  (define (inc x) (+ x 1))
  (filtered-accumulate prime? add 0 square a inc b))

;; (sum-squared-primes 1 10)
;; 2^2 + 3^2 + 5^2 + 7^2 = 4 + 9 + 25 + 49 = 87

(define (prod-up-to-and-prime-to n)
  (define (gcd x y)
    (if (= y 0) x (gcd y (remainder x y))))
  (define (relatively-prime-to? i)
    (= (gcd i n) 1))
  (define (prod x y) (* x y))
  (define (identity x) x)
  (define (increment x) (+ x 1))
  (filtered-accumulate relatively-prime-to? prod 1 identity 1 increment n))

;; (prod-up-to-and-prime-to 10)
;; 1 * 3 * 7 * 9 = 189

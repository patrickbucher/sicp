(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; (integral cube 0 1 0.01)
;; (integral cube 0 1 0.001)

(define (simpsons-rule f a b n)
  (define (multiplier i)
    (cond ((= (remainder i 2) 1) 4)
	  ((= (remainder i 2) 0) 2)
	  (else 1)))
  (* (/ (/ (- b a) n) 3)
     (sum f a

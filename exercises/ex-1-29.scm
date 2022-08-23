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
;; .24998750000000042
;; (integral cube 0 1 0.001)
;; .249999875000001

(define (weighted-sum term a next b multiplier k n)
  (if (>= k n)
      0
      (+ (* (multiplier k)
	    (term a))
	 (weighted-sum term (next a) next b multiplier (+ k 1) n))))

(define (simpsons-rule f a b n)
  (define (add-h x) (+ x (/ (- b a) n)))
  (define (multiplier k)
    (cond ((= k 0) 1)
	  ((= k n) 1)
	  ((even? k) 2)
	  (else 4)))
  (* (/ (- b a) (* 3 n))
     (weighted-sum f a add-h b multiplier 0 n)))

;; (simpsons-rule cube 0 1 100)
;; 37/150
;; .24666666666666667
;; (simpsons-rule cube 0 1 1000)
;; 749/3000
;; .24966666666666668

;; according to Wolfram Alpha:
;; "integral of cube from 0 to 1"
;; 0.25

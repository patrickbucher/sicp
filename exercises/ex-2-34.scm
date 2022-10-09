(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

;; (accumulate + 0 (list 1 2 3 4 5))
;; 15
;; (accumulate * 1 (list 1 2 3 4 5))
;; 120

(define (horner-eval x coefficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (+ this-coeff (* x higher-terms)))
   0
   coefficient-sequence))

;; (horner-eval 2 (list 1 3 0 5 0 1))
;; 79
;; check:
;; 1 + 3x + 5x³ + x⁵
;; = 1 + 3*2 + 5*8 + 32
;; = 1 + 6 + 40 + 32
;; = 79

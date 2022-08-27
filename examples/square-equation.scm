(define (solve a b c)
  (let ((determinant (- (square b) (* 4 a c)))
	(denominator (* 2 1)))
    (cond ((< determinant 0) '())
	  ((= determinant 0) (cons (/ (- b) denominator) '()))
	  (else (cons (/ (+ (- b) (sqrt determinant)) denominator)
		      (/ (- (- b) (sqrt determinant)) denominator))))))

;; (solve 2 3 1)
;; (-1 . -2)

;; (solve 1 -2 -3)
;; (3 . -1)

;; (solve 2 2 2)
;; ()

;; (solve 1 2 1)
;; (-1)

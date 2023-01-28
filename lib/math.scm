(define (pow b e)
  (define (next e acc)
    (if (= e 1)
	acc
	(next (- e 1) (* acc b))))
  (cond ((= e 0) 1)
	((< e 0) (error "negative exponent not implemented"))
	(else (next e b))))

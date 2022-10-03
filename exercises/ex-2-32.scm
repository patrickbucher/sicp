(define (identity x) x)

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map <???> rest)))))

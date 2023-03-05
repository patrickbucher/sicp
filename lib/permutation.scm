(define (permutate xs)
  (define (next left right acc)
    (if (null? right)
	acc
	(next (append left (list (car right)))
	      (cdr right)
	      (append acc (map (lambda (p) (cons (car right) p))
			       (permutate (append left (cdr right))))))))
  (cond ((null? xs) '())
	((= (length xs) 1) (list xs))
	(else (next '() xs '()))))

(define (before? permutations x y)
  (define (next elements got-x?)
    (cond ((null? elements)
	   #f)
	  ((equal? (car elements) x)
	   (next (cdr elements) #t))
	  ((equal? (car elements) y)
	   got-x?)
	  (else
	   (next (cdr elements) got-x?))))
  (filter (lambda (p) (next p #f)) permutations))


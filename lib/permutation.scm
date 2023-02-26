(define (accumulate op seq)
  (define (next seq acc)
    (if (null? seq)
	acc
	(next (cdr seq) (append acc (op (car seq))))))
  (next seq '()))

(define (separate-each seq)
  (define (next left right acc)
    (if (null? right)
	(reverse acc)
	(let ((head (car right)))
	  (let ((rest (filter (lambda (e) (not (equal? e head))) seq)))
	    (next (cons head left)
		  (cdr right)
		  (cons (cons head rest) acc))))))
  (next '() seq '()))

(define (permutate seq)
  (cond ((null? seq) '())
	((= (length seq) 1) (list seq))
	(else
	 (let ((headed (separate-each seq)))
	   (accumulate (lambda (h)
			 (let ((head (car h))
			       (rest (cdr h)))
			   (let ((perms (permutate rest)))
			     (map (lambda (p) (cons head p))
				  perms))))
		       headed)))))
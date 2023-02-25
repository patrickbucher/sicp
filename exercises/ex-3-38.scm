(define balance 100)

(define (peter balance) (+ balance 10))
(define (paul balance) (- balance 20))
(define (mary balance) (- balance (/ balance 2)))

(define (apply transactions balance)
  (if (null? transactions)
      balance
      (apply (cdr transactions) ((car transactions) balance))))

(define (permutations elements)
  (define (each-to-front elems included acc)
    (if (null? included)
	acc
	(let ((front (car included)))
	  (let ((rest (filter (lambda (e) (not (equal? front e))) elems)))
	    (each-to-front elems
			   (cdr included)
			   (cons (cons front rest) acc))))))
  (cond ((null? elements) '())
	((= (length elements) 1) elements)
	(else
	 (let ((headed (each-to-front elements elements '())))
	   (map (lambda (p)
		  (let ((first (car p))
			(rest (cdr p)))
		    ;; TODO: cons first to each of the permutations...
		    (cons first (permutations rest))))
		headed)))))

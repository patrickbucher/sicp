(define (reduce combine elements init)
  (define (next rest acc)
    (if (null? rest)
	acc
	(let ((head (car rest))
	      (tail (cdr rest)))
	  (next tail (combine head acc)))))
  (next elements init))

(define (partition predicate elements)
  (define (pigeonhole elem acc)
    (let ((matching (car acc))
	  (failing (cadr acc)))
      (if (predicate elem)
	  (list (append matching (list elem))
		failing)
	  (list matching
		(append failing (list elem))))))
  (reduce pigeonhole
	  elements
	  '(() ())))

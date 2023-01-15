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

(define (prepend n element elements)
  (if (<= n 0)
      elements
      (prepend (- n 1) element (cons element elements))))

(define (combine l1 l2 op)
  (define (next left right acc)
    (if (null? left)
	acc
	(next (cdr left)
	      (cdr right)
	      (append acc (list (op (car left) (car right)))))))
  (if (not (= (length l1) (length l2)))
      (error "l1 and l2 have different lengths")
      (next l1 l2 '())))

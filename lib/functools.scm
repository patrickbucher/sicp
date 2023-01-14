(define (reduce elements combine init)
  (define (next rest acc)
    (if (null? rest)
	acc
	(let ((head (car rest))
	      (tail (cdr rest)))
	  (next tail (combine head acc)))))
  (next elements init))

(define (partition elements predicate)
  (define (pigeonhole elem acc)
    (let ((matching (car acc))
	  (failing (cdr acc)))
      (if (predicate elem)
	  (cons (append matching (list elem))
		failing)
	  (cons matching
		(append failing (list elem))))))
  (reduce elements
	  pigeonhole
	  (cons '() '())))

(define (reverse items)
  (define (next xs ys)
    (if (null? xs)
	ys
	(next (cdr xs) (cons (car xs) ys))))
  (next items '()))

;; (reverse (list 1 3 5 7 9))
;; (9 7 5 3 1)

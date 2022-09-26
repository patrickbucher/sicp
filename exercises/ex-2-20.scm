(define (same-parity x . ys)
  (define (odd? i) (= (remainder i 2) 1))
  (define (even? i) (= (remainder i 2) 0))
  (define (reverse xs ys)
    (if (null? xs)
	ys
	(reverse (cdr xs) (cons (car xs) ys))))
  (define (filter items predicate acc)
    (if (null? items)
	(reverse acc (list))
	(let ((first (car items))
	      (rest (cdr items)))
	  (filter rest predicate (if (predicate first)
				     (cons first acc)
				     acc)))))
  (let ((predicate (if (odd? x)
		       odd?
		       even?)))
    (filter ys predicate (list x))))

;; (same-parity 1 2 3 4 5 6 7 8 9)
;; (1 3 5 7 9)
;; (same-parity 0 1 2 3 4 5 6 7 8 9)
;; (0 2 4 6 8)

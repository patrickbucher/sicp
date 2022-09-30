(define (reverse xs)
  (define (next xs acc)
    (if (null? xs)
	acc
	(next (cdr xs)
	      (cons (car xs)
		    acc))))
  (next xs '()))

;; (reverse (list 1 2 3 4 5))
;; (5 4 3 2 1)

(define (deep-reverse xs)
  (define (next xs acc)
    (cond ((null? xs)
	   acc)
	  ((list? (car xs))
	   (next (cdr xs) (cons (deep-reverse (car xs)) acc)))
	  (else
	   (next (cdr xs) (cons (car xs) acc)))))
  (next xs '()))

(define nested (list 1 2 (list 3 4 5) (list 6 7 (list 8 9))))

;; (deep-reverse nested)
;; (((9 8) 7 6) (5 4 3) 2 1)

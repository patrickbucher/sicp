(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree) (square tree) 0))
	(else (+ (sum-odd-squares
		  (car tree))
		 (sum-odd-squares
		  (cdr tree))))))

;; (sum-odd-squares (list 1 2 (list 3 (list 4) 5) (list 6 7) 8))
;; 84

(define (fib n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(else (+ (fib (- n 1)) (fib (- n 2))))))

(define nil '())

(define (even-fibs n)
  (define (next k)
    (if (> k n)
	nil
	(let ((f (fib k)))
	  (if (even? f)
	      (cons f (next (+ k 1)))
	      (next (+ k 1))))))
  (next 0))

;; (even-fibs 10)
;; (2 8 34)

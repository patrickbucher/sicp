(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

;; (accumulate + 0 (list 1 2 3))
;; 6
;; (accumulate * 1 (list 1 2 3))
;; 6
;; (accumulate cons '() (list 1 2 3 4 5))
;; (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval
	     (+ low 1)
	     high))))

;; (enumerate-interval 1 10)
;; (1 2 3 4 5 6 7 8 9 10)

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else (append
	       (enumerate-tree (car tree))
	       (enumerate-tree (cdr tree))))))

;; (enumerate-tree (list 1 (list 2 3 (list 4 5) 6) 7 8 9))
;; (1 2 3 4 5 6 7 8 9)

(define (sum-odd-squares tree)
  (accumulate
   +
   0
   (map square
	(filter odd?
		(enumerate-tree tree)))))

;; (sum-odd-squares (list 1 (list 2 3 (list 4 5) 6) 7 8 9))
;; 165

(define (fib n)
  (if (or (= n 0) (= n 1))
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

(define (even-fibs n)
  (accumulate
   cons
   '()
   (filter even?
	   (map fib
		(enumerate-interval 0 n)))))

;; (even-fibs 10)
;; (2 8 34)

(define (list-fib-squares n)
  (accumulate
   cons
   '()
   (map square
	(map fib
	     (enumerate-interval 0 n)))))

;; (list-fib-squares 10)
;; (1 1 4 9 25 64 169 441 1156 3025 7921)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate
   *
   1
   (map square (filter odd? sequence))))

;; (product-of-squares-of-odd-elements (list 1 2 3 4 5))
;; 225
;; (product-of-squares-of-odd-elements (enumerate-interval 1 5))
;; 225

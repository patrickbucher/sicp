;; polynomial:
;; 3x⁵ + 2x³ + x² + 4x + 5
;; ordered representation of terms:
;; (3 0 2 1 4 5)
;; counted representation of terms:
;; ((5 3) (3 2) (2 1) (1 4) (0 5))

(define (ordered->counted coeffs)
  (define (dec x) (- x 1))
  (define (coeff-zero? pair) (= (cadr pair) 0))
  (let ((order (dec (length coeffs))))
    (filter (lambda (p) (not (coeff-zero? p)))
	    (zip-to-pairs (enumerate order -1 dec)
			  coeffs))))

(define ordered-term-list '(3 0 2 1 4 5))

;; (ordered->counted ordered-term-list)
;; ((5 3) (3 2) (2 1) (1 4) (0 5))

(define (counted->ordered pairs)
  (define (next acc k rest)
    (if (< k 0)
	acc
	(let ((head (car rest))
	      (tail (cdr rest)))
	  (let ((head-order (car head))
		(head-coeff (cadr head)))
	    (if (= k head-order)
		(next (append acc (list head-coeff))
		      (- k 1)
		      tail)
		(next (append acc (list 0))
		      (- k 1)
		      rest))))))
  (let ((order (caar pairs)))
    (next '() order pairs)))

(define counted-term-list '((5 3) (3 2) (2 1) (1 4) (0 5)))

;; (counted->ordered counted-term-list)
;; (3 0 2 1 4 5)

(define (enumerate start stop step)
  (define (next acc i)
    (if (= i stop)
	acc
	(next (append acc (list i)) (step i))))
  (next '() start))

(define (zip-to-pairs left right)
  (define (next acc l r)
    (if (= (length l) 0)
	acc
	(next (append acc (list (list (car l) (car r))))
	      (cdr l)
	      (cdr r))))
  (if (not (= (length left)
	      (length right)))
      (error "cannot zip lists of different lengths")
      (next '() left right)))

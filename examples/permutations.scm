(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
		 (map (lambda (p)
			(cons x p))
		      (permutations
		       (remove x s))))
	       s)))

;; (permutations (list 1 2 3))
;; ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))

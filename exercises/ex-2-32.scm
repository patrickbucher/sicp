(define (identity x) x)

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (r) (cons (car s) r)) rest)))))

;; (subsets (list 1 2 3))
;; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

;; The only subset of an empty set is an empty set.
;; For a non-empty set, the first element is separated from the rest.
;; The first element is then combined with all the subsets not containing that first element.
;; This is a depth-first approach; therefore the result starts with an empty set, followed
;; by the set (3), (2), (2 3), etc.

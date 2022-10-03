(define t (list 1 2 (list 3 4 (list 5 (list 6) 7) 8) 9))

(define (square-tree tree)
  (cond ((null? tree) '())
	((number? tree) (* tree tree))
	(else
	 (cons (square-tree (car tree))
	       (square-tree (cdr tree))))))

;; (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))
;; (square-tree t)
;; (1 4 (9 16 (25 (36) 49) 64) 81)

(define (square-tree-map tree)
  (map (lambda (sub-tree)
	 (cond ((null? sub-tree) '())
	       ((number? sub-tree) (* sub-tree sub-tree))
	       (else (square-tree-map sub-tree))))
       tree))

;; (square-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;; (1 (4 (9 16) 25) (36 49))
;; (square-tree-map t)
;; (1 4 (9 16 (25 (36) 49) 64) 81)

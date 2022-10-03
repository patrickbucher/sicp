(define (tree-map f tree)
  (map (lambda (node)
	 (if (pair? node)
	     (tree-map f node)
	     (f node)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

(define t (list 1 (list 2 (list 3 4) 5) (list 6 7)))

;; (square-tree t)
;; (1 (4 (9 16) 25) (36 49))


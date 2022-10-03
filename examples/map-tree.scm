(define nil '())

(define (scale-tree tree factor)
  (cond ((null? tree) nil)
	((not (pair? tree))
	 (* tree factor))
	(else
	 (cons (scale-tree (car tree)
			   factor)
	       (scale-tree (cdr tree)
			   factor)))))

(define t (list 1 (list 2 3) (list 4 5 (list 6 7) 8) 9))

;; t
;; (1 (2 3) (4 5 (6 7) 8) 9)
;; (scale-tree t 10)
;; (10 (20 30) (40 50 (60 70) 80) 90)

(define (scale-tree-map tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (scale-tree-map sub-tree factor)
	     (* sub-tree factor)))
       tree))

;; (scale-tree-map t 10)
;; (10 (20 30) (40 50 (60 70) 80) 90)

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (entry set)) true)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))

(define t (adjoin-set
	   2
	   (adjoin-set
	    8
	    (adjoin-set
	     4
	     (adjoin-set
	      3
	      (adjoin-set
	       7
	       (adjoin-set
		5
		'())))))))

;; (element-of-set? 4 t)
;; #t
;; (element-of-set? 1 t)
;; #f


(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

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

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append
       (tree->list-1
	(left-branch tree))
       (cons (entry tree)
	     (tree->list-1
	      (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list
	 (left-branch tree)
	 (cons (entry tree)
	       (copy-to-list
		(right-branch tree)
		result-list)))))
  (copy-to-list tree '()))

(define t1
  (adjoin-set
   11
   (adjoin-set
    5
    (adjoin-set
     1
     (adjoin-set
      9
      (adjoin-set
       3
       (adjoin-set
	7
	'())))))))

(define t2
  (adjoin-set
   11
   (adjoin-set
    9
    (adjoin-set
     5
     (adjoin-set
      7
      (adjoin-set
       1
       (adjoin-set
	3
	'())))))))

(define t3
  (adjoin-set
   11
   (adjoin-set
    7
    (adjoin-set
     9
     (adjoin-set
      1
      (adjoin-set
       3
       (adjoin-set
	5
	'())))))))

(define balanced
  (adjoin-set
   8
   (adjoin-set
    6
    (adjoin-set
     4
     (adjoin-set
      2
      (adjoin-set
       7
       (adjoin-set
	3
	(adjoin-set
	 5
	 '()))))))))

(define unbalanced
  (adjoin-set
   7
   (adjoin-set
    6
    (adjoin-set
     5
     (adjoin-set
      4
      (adjoin-set
       3
       (adjoin-set
	2
	(adjoin-set
	 1
	 '()))))))))

;; (tree->list-1 t1)
;; (1 3 5 7 9 11)
;; (tree->list-2 t1)
;; (1 3 5 7 9 11)

;; (tree->list-1 t2)
;; (1 3 5 7 9 11)
;; (tree->list-2 t2)
;; (1 3 5 7 9 11)

;; (tree->list-1 t3)
;; (1 3 5 7 9 11)
;; (tree->list-2 t3)
;; (1 3 5 7 9 11)

;; (tree->list-1 unbalanced)
;; (1 2 3 4 5 6 7)
;; (tree->list-2 unbalanced)
;; (1 2 3 4 5 6 7)

;; (tree->list-1 balanced)
;; (2 3 4 5 6 7 8)
;; (tree->list-2 balanced)
;; (2 3 4 5 6 7 8)

;; 1) Both procedures produce the same result when given the same input.


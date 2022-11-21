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

(define (list->tree elements)
  (car (partial-tree
	elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry
				 left-tree
				 right-tree)
		      remaining-elts))))))))

(define (extend s v)
  (define (prepend left right)
    (if (null? right)
	(append left (list v))
	(let ((r (car right)))
	  (cond ((= v r) (append left right))
		((< v r) (append left (list v) right))
		((> v r) (prepend (append left (list r))
				  (cdr right)))))))
  (prepend '() s))

(define (list-contains? l v)
  (cond ((null? l) #f)
	((= v (car l)) #t)
	(else (list-contains? (cdr l) v))))

(define (list-intersection-set s1 s2)
  (define (union remainder acc)
    (if (null? remainder)
	acc
	(if (list-contains? s1 (car remainder))
	    (union (cdr remainder) (extend acc (car remainder)))
	    (union (cdr remainder) acc))))
  (union s2 '()))

(define (tree-contains? t v)
  (cond ((null? t) #f)
	((= (entry t) v) #t)
	((> (entry t) v) (tree-contains? (left-branch t) v))
	((< (entry t) v) (tree-contains? (right-branch t) v))))

(define (intersection-set t1 t2)
  (if (null? t1)
      '()
      (let ((v (entry t1))
	    (l (left-branch t1))
	    (r (right-branch t1)))
	(let ((left-set (intersection-set l t2))
	      (right-set (intersection-set r t2)))
	  (if (tree-contains? t2 v)
	      (extend (append left-set right-set) v)
	      (append left-set right-set))))))

;; TODO union-set

(define t (list->tree '(1 3 5 7 9 11)))
(define u (list->tree '(1 2 3 4 7 8 9)))


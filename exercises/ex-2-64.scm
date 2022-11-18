(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree
	elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size
	     (quotient (- n 1) 2)))
	(let ((left-result
	       (partial-tree
		elts left-size)))
	  (let ((left-tree
		 (car left-result))
		(non-left-elts
		 (cdr left-result))
		(right-size
		 (- n (+ left-size 1))))
	    (let ((this-entry
		   (car non-left-elts))
		  (right-result
		   (partial-tree
		    (cdr non-left-elts)
		    right-size)))
	      (let ((right-tree
		     (car right-result))
		    (remaining-elts
		     (cdr right-result)))
		(cons (make-tree this-entry
				 left-tree
				 right-tree)
		      remaining-elts))))))))

;; 1) The procedure `partial-tree` expects an ordered list of
;; elements, and the length of that list. The elements are split up
;; into two lists (left and right) of roughly equal size (+/- 1
;; element). Each of those lists is then processed using a recursive
;; call to `partial-tree`. The element between those two lists is
;; turned into a tree node, to which the new left and right trees (the
;; results of the recursive calls) are attached.  The procedure
;; returns a cons cell, where the first element (car) represents the
;; tree structure that was built up so far, and the second element
;; (cdr) represents the elements that are not yet in the tree
;; structure, and, thus, require further processing.

;; 2) For every element, `partial-tree` is called twice, so the growth
;; is 2*n. With the constant factor 2 ignored, the complexity becomes
;; O(n), given that the input elements are sorted.

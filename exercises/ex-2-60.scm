;; element-of-set? also needs to check n elements with duplicates
;; in the worst case. Some lookups are faster, but as the set grows
;; as duplicates are allowed, the effect will be minor: O(n).
(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

;; adjoin-set prepends an element of the set, which works in constant
;; time. The element-of-set? check, requiring n steps, is no longer
;; needed, so adjon-set works in constant time O(1) rather than O(n).
(define (adjoin-set x set)
  (cons x set))

;; intersection-set can no longer works on proper sets but on lists
;; of numbers, which complicates the implementation. The procedure
;; element-of-set? is now also needed for accumulating elements.
;; Each element in set1 needs to be looked up in set2 and the result
;; set, so that intersection-set works in O(n*m).
(define (intersection-set set1 set2)
  (define (intersect left right result)
    (cond ((null? left) result)
	  ((null? right) result)
	  ((and (element-of-set? (car left) right)
		(not (element-of-set? (car left) result)))
	   (intersect (cdr left) right (cons (car left) result)))
	  (else
	   (intersect (cdr left) right result))))
  (intersect set1 set2 '()))
  
;; union-set also needs to check whether or not an element is
;; already in the resulting set, which requires extra steps and
;; results in a complexity of O(n*m).
(define (union-set set1 set2)
  (define (union left right result)
    (cond ((and (null? left) (null? right))
	   result)
	  ((not (element-of-set? (car left) result))
	   ;; switching left/right to drain both
	   (union right (cdr left) (cons (car left) result)))
	  (else
	   (union right (cdr left) result))))
  (union set1 set2 '()))

;; allowing for duplicates
(define s (list 1 2 3 4 1 2 3 4 1 2 3 4))
(define t (list 3 4 5 6 3 4 5 6 3 4 5 6))

;; (intersection-set s t)
;; (4 3)
;; (intersection-set t s)
;; (4 3)

;; (union-set s t)
;; (6 5 4 2 3 1)
;; (union-set t s)
;; (6 5 2 4 1 3)

;; Conclusion: The duplicate check logic was moved out of adjoin-set
;; into the union and intersection procedures. While the net effect
;; on runtime performance might even out, the elegance of the imple-
;; mentation clearly suffered. The procedures also no work on proper
;; sets, but on lists pretending to represent sets. The old implemen-
;; tation was clearer and easier to understand. Having the constructor
;; procedure as some kind of gatekeeper simplifies the rest.


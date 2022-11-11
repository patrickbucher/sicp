(define (adjoin-set x set)
  (define (prepend left right)
    (cond ((null? right) (append left (list x)))
	  ((< x (car right)) (append left (list x) right))
	  ((= x (car right)) (append left right))
	  (else (prepend (append left (list (car right))) (cdr right)))))
  (prepend '() set))

(define (union-set set1 set2)
  (define (adjoin-next left right acc)
    (cond ((and (null? left) (null? right)) acc)
	  ((null? left) (adjoin-next '() (cdr right) (adjoin-set (car right) acc)))
	  ((null? right) (adjoin-next (cdr left) '() (adjoin-set (car left) acc)))
	  (else
	   (let ((x1 (car left))
		 (x2 (car right)))
	     (cond ((< x1 x2) (adjoin-next (cdr left) right (adjoin-set x1 acc)))
		   ((> x1 x2) (adjoin-next left (cdr right) (adjoin-set x2 acc)))
		   (else (adjoin-next (cdr left) (cdr right) (adjoin-set x1 acc))))))))
  (adjoin-next set1 set2 '()))

(define s '(1 3 4 5 8))
(define t '(2 3 4 5 6 7 8))

;; (union-set s t)
;; (1 2 3 4 5 6 7 8)


(define nil '())

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items nil))

;; The recursive process expresses the whole result as a single expression:
;; (cons (car (square item)) (square-list (cdr items)))
;; This preserves the order.
;; The iterative process, however, starts with an empty list.
;; It conses each computed item to the front of the result list.
;; The items are processes from the left to the right,
;; but the results are consed from the right to the left.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items nil))

;; (square-list (list 1 2 3 4 5))
;; (((((() . 1) . 4) . 9) . 16) . 25)

;; This conses a list in front of a single element, which creates a nested list.

(define x (list (list 1 2) (list 3 4)))

(define y (list (list (list 1 2) (list 3 4)) (list 5 6) (list 7 8) 9))

(define (fringe xs)
  (cond ((null? xs) '())
	((list? xs) (append (fringe (car xs))
			    (fringe (cdr xs))))
	(else (list xs))))

;; (fringe x)
;; (1 2 3 4)
;; (fringe (list x x))
;; (1 2 3 4 1 2 3 4)
;; (fringe y)
;; (1 2 3 4 5 6 7 8 9)
;; (finge (list x y))
;; (1 2 3 4 1 2 3 4 5 6 7 8 9)

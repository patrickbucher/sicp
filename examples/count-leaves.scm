(define (count-leaves tree)
  (cond ((null? tree) 0)
	((not (pair? tree)) 1)
	(else (+ (count-leaves (car tree))
		 (count-leaves (cdr tree))))))

(define l (cons (cons 1 2) (cons 3 4)))
;; (count-leaves l)
;; 4

(define m (cons (cons 1 (cons 2 3)) (cons (cons 4 5) (cons 6 7))))
;; (count-leaves m)
;; 7

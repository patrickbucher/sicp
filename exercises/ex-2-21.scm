(define nil '())

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
	    (square-list (cdr items)))))

;; (square-list (list 1 2 3 4 5))
;; (1 4 9 16 25)

(define (square-list items)
  (map (lambda (i) (* i i)) items))

;; (square-list (list 1 2 3 4 5))
;; (1 4 9 16 25)

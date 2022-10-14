(define nil '())

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op initial (cdr sequence)))))

;; (fold-right + 0 (list 1 2 3 4))
;; 10

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

;; (fold-left + 0 (list 1 2 3 4))
;; 10

;; (fold-right / 1 (list 1 2 3))
;; (/ 1 (fold-right / 1 (list 2 3)))
;; (/ 1 (/ 2 (fold-right / 1 (list 3))))
;; (/ 1 (/ 2 (/ 3 (fold-right / 1 (list)))))
;; (/ 1 (/ 2 (/ 3 1)))
;; (/ 1 (/ 2 3))
;; (/ 1 2/3)
;; 3/2

;; (fold-left / 1 (list 1 2 3))
;; (iter 1 (list 1 2 3))
;; (iter (/ 1 1) (list 2 3))
;; (iter 1 (list 2 3))
;; (iter (/ 1 2) (list 3))
;; (iter 1/2 (list 3))
;; (iter (/ 1/2 3) (list))
;; (iter 1/6 (list))
;; 1/6

;; (fold-right list nil (list 1 2 3))
;; (list 1 (fold-right list nil (list 2 3)))
;; (list 1 (list 2 (fold-right list nil (list 3))))
;; (list 1 (list 2 (list 3 (fold-right list nil (list)))))
;; (list 1 (list 2 (list 3 nil)))
;; (list 1 (list 2 (3 ())))
;; (list 1 (2 (3 ())))
;; (1 (2 (3 ())))

;; (fold-left list nil (list 1 2 3))
;; (iter nil (list 1 2 3))
;; (iter (list () 1) (list 2 3))
;; (iter (() 1) (list 2 3))
;; (iter (list (() 1) 2) (list 3))
;; (iter ((() 1) 2) (list 3))
;; (iter (list ((() 1) 2) 3) (list))
;; (iter (((() 1) 2) 3) (list))
;; (((() 1) 2) 3)

;; If (= (op a b) (op b a)) holds true, then both fold-left and fold-right return the same result.
;; If op has the commutative property, fold-left and fold-right return the same result.

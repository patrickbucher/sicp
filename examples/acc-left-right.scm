;; fold-right
(define (accumulate-recursive op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate-recursive op init (cdr seq)))))

;; (accumulate-recursive + 0 (list 1 2 3 4 5))
;; 15
;; (accumulate-recursive cons (list 1 2 3) (list 4 5 6))
;; (4 5 6 1 2 3)
;; (accumulate-recursive cons (list 4 5 6) (list 1 2 3))
;; (1 2 3 4 5 6)

(define (exp b n)
  (if (= n 1)
      b
      (* b (exp b (- n 1)))))

;; (exp 2 3)
;; 8
;; (exp 3 2)
;; 9
;; (exp (exp 2 3) 2)
;; 64
;; (exp (exp 2 2) 3)
;; 64

;; Note: This is not the same as 2^(3^2)
;; (accumulate-recursive exp 2 (list 3 2))
;; 81
;; (accumulate-recursive exp 2 (list 3 2))
;; (exp 3 (accumulate-recursive exp 2 (list 2)))
;; (exp 3 (exp 2 (accumulate-recursive exp 2 (list))))
;; (exp 3 (exp 2 2))
;; (exp 3 4)
;; 81

;; fold-left
(define (accumulate-iterative op init seq)
  (define (next acc rest)
    (if (null? rest)
	acc
	(next (op acc (car rest))
	      (cdr rest))))
  (next init seq))

;; (accumulate-iterative + 0 (list 1 2 3 4 5))
;; 15
;; (accumulate-iterative cons (list 1 2 3) (list 4 5 6))
;; ((((1 2 3) . 4) . 5) . 6)
;; (accumulate-iterative cons (list 4 5 6) (list 1 2 3))
;; ((((4 5 6) . 1) . 2) . 3)

;; Note: This is the same as 2^(3^2)
;; (accumulate-iterative exp 2 (list 3 2))
;; 64
;; (accumulate-iterative exp 2 (list 3 2))
;; (next 2 (list 3 2))
;; (next (exp 2 3) (list 2))
;; (next 8 (list 2))
;; (next (exp 8 2) (list))
;; (next 64 (list))
;; 64

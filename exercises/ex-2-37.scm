(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; (dot-product (list 1 2 3) (list 4 5 6))
;; 32

(define m (list (list 0 1) (list 2 3) (list 4 5))) ; 3 rows, 2 cols
(define n (list (list 0 1 2) (list 3 4 5))) ; 2 rows, 3 cols
(define v (list 1 2 3))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

;; (matrix-*-vector m (list 1 2 3))
;; (1 10 27)
;; (matrix-*-vector n (list 1 2))
;; (3 24)

(define (transpose mat)
  (accumulate-n cons '() mat))

;; m
;; ((0 1) (2 3) (4 5))
;; (transpose m)
;; ((0 2 4) (1 3 5))
;; (transpose (transpose m))
;; ((0 1) (2 3) (4 5))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (w) (matrix-*-vector cols w)) m)))

;; (matrix-*-matrix m n)
;; ((3 4 5) (9 14 19) (15 24 33))

;; .       0  1  2
;;         3  4  5
;;        --------
;; 0  1 |  3  4  5
;; 2  3 |  9 14 10
;; 4  5 | 15 24 33

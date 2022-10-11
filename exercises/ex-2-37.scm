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

;; TODO: This does not match the structure from the exercise given as:
;; (define (matrix-*-vector m v) (map <??> m))
(define (matrix-*-vector m v)
  (accumulate-n * 1 (list (map (lambda (row) (accumulate + 0 row)) m) v)))

;; (matrix-*-vector m (list 1 2 3))
;; (1 10 27)
;; (matrix-*-vector n (list 1 2))
;; (3 24)

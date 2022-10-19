(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval a b)
  (define (next i acc)
    (if (> i b)
	acc
	(next (+ i 1) (append acc (list i)))))
  (next a '()))

(define (make-pairs n)
  (map (lambda (i)
	 (map (lambda (j)
		(list i j))
	      (enumerate-interval 1 n)))
       (enumerate-interval 1 n)))

;; (make-pairs 3)
;; (((1 1) (1 2) (1 3)) ((2 1) (2 2) (2 3)) ((3 1) (3 2) (3 3)))

(define (make-flat-pairs n)
  (flatmap append (make-pairs n)))

;; (make-flat-pairs 3)
;; ((1 1) (1 2) (1 3) (2 1) (2 2) (2 3) (3 1) (3 2) (3 3))


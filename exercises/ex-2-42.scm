(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions)
	   (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (safe? k positions)
  (if (null? positions)
      #t
      (let ((this-pos (car positions))
	    (other-pos (cdr positions)))
	(if (null? other-pos)
	    #t
	    (and (not (check? this-pos (car other-pos)))
		 (safe? k (cdr other-pos)))))))

(define (check? pos-a pos-b)
  (or (same-row? pos-a pos-b)
      (same-col? pos-a pos-b)
      (same-diag? pos-a pos-b)))

(define (get-row pos) (car pos))

(define (get-col pos) (cadr pos))

(define (same-row? pos-a pos-b)
  (= (get-row pos-a)
     (get-row pos-b)))

(define (same-col? pos-a pos-b)
  (= (get-col pos-a)
     (get-col pos-b)))

(define (same-diag? pos-a pos-b)
  (= (abs (- (get-row pos-a) (get-row pos-b)))
     (abs (- (get-col pos-a) (get-col pos-b)))))

(define (adjoin-position row col rest-of-queens)
  (cons (list row col) rest-of-queens))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (enumerate-interval a b)
  (define (next acc i)
    (if (> i b)
	acc
	(next (append acc (list i)) (+ i 1))))
  (next '() a))

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
		   (adjoin-position
		    new-row
		    k
		    rest-of-queens))
		 (enumerate-interval
		  1
		  board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '()) ;; TODO

(define (safe? rc positions) #f) ;; TODO

(define (adjoin-position row col rest-of-queens) '()) ;; TODO

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

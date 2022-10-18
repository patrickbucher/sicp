(define (enumerate-interval a b)
  (define (next i acc)
    (if (> i b)
	acc
	(next (+ i 1) (append acc (list i)))))
  (next a '()))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (triplets n)
  (flatmap
   append
   (map (lambda (i)
	  (flatmap
	   append (map (lambda (j)
			 (map (lambda (k) (list i j k))
			      (enumerate-interval 1 (- j 1))))
		       (enumerate-interval 2 (- i 1)))))
	(enumerate-interval 3 n))))

(define (triplets-for-sum n sum)
  (filter (lambda (triplet)
	    (= (+ (car triplet)
		  (cadr triplet)
		  (caddr triplet))
	       sum))
	  (triplets n)))

;; (triplets-for-sum 10 9)
;; ((4 3 2) (5 3 1) (6 2 1))

;; (triplets-for-sum 20 50)
;; ((18 17 15) (19 16 15) (19 17 14) (19 18 13) (20 16 14) (20 17 13) (20 18 12) (20 19 11))

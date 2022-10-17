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

(define (unique-pairs n)
  (flatmap
   append
   (map (lambda (i)
	  (map (lambda (j) (list i j))
	       (enumerate-interval 1 (- i 1))))
	(enumerate-interval 1 n))))

(define (prime? n)
  (define (next i)
    (cond ((> i (/ n 2)) #t)
	  ((= 0 (remainder n i)) #f)
	  (else (next (+ i 1)))))
  (if (< n 2)
      #f
      (next 2)))

(define (prime-sum-pairs n)
  (filter (lambda (t) (prime? (caddr t)))
	  (map (lambda (p)
		 (list (car p)
		       (cadr p)
		       (+ (car p) (cadr p))))
	       (unique-pairs n))))

;; (prime-sum-pairs 4)
;; ((2 1 3) (3 2 5) (4 1 5) (4 3 7))

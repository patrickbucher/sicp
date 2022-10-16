(define (enumerate-interval a b)
  (define (next acc i)
    (if (> i b)
	acc
	(next (append acc (list i)) (+ i 1))))
  (next '() a))

;; (enumerate-interval 1 5)
;; (1 2 3 4 5)

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

;; (accumulate + 0 (enumerate-interval 1 3))
;; 6

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

;; (flatmap (lambda (i) (list (* i 2))) (enumerate-interval 1 10))
;; (2 4 6 8 10 12 14 16 18 20)

(define (prime? n)
  (define (next i)
    (cond ((> i (/ n 2)) #t)
	  ((= (remainder n i) 0) #f)
	  (else (next (+ i 1)))))
  (if (< n 2)
      #f
      (next 2)))

;; (map (lambda (i) (list i (prime? i))) (enumerate-interval 1 10))
;; ((1 #f) (2 #t) (3 #t) (4 #f) (5 #t) (6 #f) (7 #t) (8 #f) (9 #f) (10 #f))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

;; (prime-sum? (list 2 1))
;; #t
;; (prime-sum? (list 4 3))
;; #t
;; (prime-sum? (list 5 4))
;; #f

(define (make-pair-sum pair)
  (list (car pair)
	(cadr pair)
	(+ (car pair) (cadr pair))))

;; (make-pair-sum (list 3 4))
;; (3 4 7)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter
	prime-sum?
	(flatmap
	 (lambda (i)
	   (map (lambda (j)
		  (list i j))
		(enumerate-interval
		 1
		 (- i 1))))
	 (enumerate-interval 1 n)))))

;; (prime-sum-pairs 5)
;; ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7))

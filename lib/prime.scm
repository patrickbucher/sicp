(define (prime? x)
  (define (next i)
    (cond ((> i (/ x 2)) #t)
	  ((= (remainder x i) 0) #f)
	  (else (next (+ i 1)))))
  (if (= x 1)
      #f
      (next 2)))

(define (enumerate a b)
  (define (next acc i)
    (if (> i b)
	acc
	(next (cons i acc) (+ i 1))))
  (if (> a b)
      '()
      (reverse (next '() a))))

;; (filter prime? (enumerate 1 100))
;; (2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)

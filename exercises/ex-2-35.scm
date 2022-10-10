(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define num-t (list 0 1 (list 2 3 (list 4 5) 6 7) 8 9))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (n)
			 (cond ((null? n) 0)
			       ((pair? n) (count-leaves n))
			       (else 1)))
		       t)))

;; (count-leaves num-t)
;; 10

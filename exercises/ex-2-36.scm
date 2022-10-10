(define nil '())

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define num-seqs (list (list 1 2 3)
		       (list 4 5 6)
		       (list 7 8 9)
		       (list 10 11 12)))

;; (accumulate-n + 0 num-seqs)
;; (22 26 30)

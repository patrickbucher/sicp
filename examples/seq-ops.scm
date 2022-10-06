(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

;; (accumulate + 0 (list 1 2 3))
;; 6
;; (accumulate * 1 (list 1 2 3))
;; 6
;; (accumulate cons '() (list 1 2 3 4 5))
;; (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval
	     (+ low 1)
	     high))))

;; (enumerate-interval 1 10)
;; (1 2 3 4 5 6 7 8 9 10)

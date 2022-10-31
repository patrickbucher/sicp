(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
	((and (pair? a) (pair? b))
	 (and (equal? (car a) (car b))
	      (equal? (cdr a) (cdr b))))
	(else (eq? a b))))

;; (equal? '(this is a list) '(this is a list))
;; #t

;; (equal? '(this is a list) '(this (is a) list))
;; #f


(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
	 '())
	((element-of-set? (car set1) set2)
	 (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define s (adjoin-set 1 (adjoin-set 2 (adjoin-set 3 '()))))
(define t (adjoin-set 2 (adjoin-set 3 (adjoin-set 4 '()))))

;; s
;; (1 2 3)
;; t
;; (2 3 4)

;; (element-of-set? 2 s)
;; #t
;; (element-of-set? 4 s)
;; #f
;; (element-of-set? 4 t)
;; #t

;; (intersection-set s t)
;; (2 3)


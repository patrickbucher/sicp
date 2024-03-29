(define (adjoin-set x set)
  (define (prepend left right)
    (cond ((null? right) (append left (list x)))
	  ((< x (car right)) (append left (list x) right))
	  ((= x (car right)) (append left right))
	  (else (prepend (append left (list (car right))) (cdr right)))))
  (prepend '() set))

(define s '(1 3 5 7 9))

;; (adjoin-set 0 s)
;; (0 1 3 5 7 9)
;; (adjoin-set 2 s)
;; (1 2 3 5 7 9)
;; (adjoin-set 4 s)
;; (1 3 4 5 7 9)
;; (adjoin-set 10 s)
;; (1 3 5 7 9 10)
;; (adjoin-set 1 s)
;; (1 3 5 7 9)
;; (adjoin-set 9 s)
;; (1 3 5 7 9)
;; (adjoin-set 5 s)
;; (1 3 5 7 9)


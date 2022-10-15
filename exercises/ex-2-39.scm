(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
	  (fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (define (next acc rest)
    (if (null? rest)
	acc
	(next (op acc (car rest))
	      (cdr rest))))
  (next init seq))

(define nil '())

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

;; place-holder definition:
;; (define (switch x y) <??>)
;;
;; (reverse-r (list 1 2 3))
;; (fold-right switch nil (list 1 2 3))
;; (switch 1 (fold-right switch nil (list 2 3)))
;; (switch 1 (switch 2 (fold-right switch nil (list 3))))
;; (switch 1 (switch 2 (switch 3 (fold-right switch init (list)))))
;; (switch 1 (switch 2 (switch 3 nil)))
;;
;; proper definition:
;; (define (switch x y) (append y (list x)))
;;
;; (switch 1 (switch 2 (list 3)))
;; (switch 1 (list 3 2))
;; (list 3 2 1)

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

;; (reverse-l (list 1 2 3))
;; (fold-left (lambda (x y) (cons y x)) nil sequence)
;; (next ((lambda (x y) (cons y x)) nil 1) (list 2 3))
;; (next (cons 1 nil) (list 2 3))
;; (next (list 1) (list 2 3))
;; (next ((lambda (x y) (cons y x)) (list 1) 2) (list 3))
;; (next (cons 2 (list 1)) (list 3))
;; (next (list 2 1) (list 3))
;; (next ((lambda (x y) (cons y x)) (list 2 1) 3) (list))
;; (next (cons 3 (list 2 1)) (list))
;; (next (list 3 2 1) (list))
;; (list 3 2 1)

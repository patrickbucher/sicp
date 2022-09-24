(define a (cons 1 2))

(define b (cons 1 (cons 2 3)))

(define c (cons (cons 1 2)
		(cons 3 4)))

(define d (cons (cons 1
		      (cons 2 3))
		4))

(define nil '()) ; no longer defined in MIT-Scheme

(define e (cons 1
		(cons 2
		      (cons 3
			    (cons 4 nil)))))

(define f (list 1 2 3 4))

(define g1 (car (cdr f)))

(define g2 (cadr f))

(define h1 (car (cdr (cdr (cdr f)))))

(define h2 (cadddr f))

(define i (cons 0 f))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

;; (list-ref (list 1 2 3 4 5 6) 3)
;; 4

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;; (length (list 1 2 3 4 5))
;; 5

(define (length-iter items)
  (define (next items n)
    (if (null? items)
	n
	(next (cdr items) (+ n 1))))
  (next items 0))

;; (length-iter (list 1 2 3 4 5 6 7))
;; 7

(define (append as bs)
  (if (null? as)
      bs
      (cons (car as (append (cdr as) bs)))))

;; (append (list 1 2 3) (list 4 5 6))
;; (1 2 3 4 5 6)

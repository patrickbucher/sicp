(define (make-sum items)
  (cond ((= (length items) 0) '())
	((= (length items) 1) (list '+ (car items) 0)) ;; neutral element: 0
	(else (list '+ (car items) (make-sum (cdr items))))))

(define (sum? x) (eq? (car x) '+))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (make-product items)
  (cond ((= (length items) 0) '())
	((= (length items) 1) (list '* (car items) 1)) ;; neutral element: 1
	(else (list '* (car items) (make-product (cdr items))))))

(define (product? x) (eq? (car x) '*))

(define (multiplier p) (cadr s))

(define (multiplicand p) (caddr s))

(define s (make-sum '(1 2 3 4)))

(define p (make-product '(1 2 3 4)))

;; s
;; (+ 1 (+ 2 (+ 3 (+ 4 0))))
;; (sum? s)
;; #t
;; (addend s)
;; 1
;; (augend s)
;; (+ 2 (+ 3 (+ 4 0)))

;; p
;; (* 1 (* 2 (* 3 (* 4 1))))
;; (product? p)
;; #t
;; (multiplier p)
;; 1
;; (multiplicand p)
;; (+ 2 (+ 3 (+ 4 0)))


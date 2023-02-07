(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y))

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))

(define y (list 'c 'd))

(define z (append x y))

;; z
;; (a b c d)
;; (cdr x)
;; (b)

;; (define w (append! x y))
;; w
;; (a b c d)
;; (cdr x)
;; (b c d)

;; Unlike append, append! modifies the underlying list structure pointed to by x.

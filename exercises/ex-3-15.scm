(define x (list 'a 'b))
(define z1 (cons x x))
(define z2 (cons (list 'a 'b) (list 'a 'b)))

;; z1
;; ((a b) a b)
;; z2
;; ((a b) a b)

;; (eq? (car z1) (car z2))
;; #f
;; (eq? (caar z1) (caar z2))
;; #t
;; -> symbols are shared, but not entire lists

(define  (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

;; (set-to-wow! z1)
;; ((wow b) wow b)
;; z1
;; ((wow b) wow b)
;; z2
;; ((a b) a b)

;; (set-to-wow! z2)
;; ((wow b) a b)
;; z1
;; ((wow b) wow b)
;; z2
;; ((wow b) a b)

;; z1 uses the x reference for both car and cdr cell. Modifying the
;; either is visible for both car and cdr. However, z2 builds up its
;; own lists, without any reference to x, so the two cells can be
;; mutated independently. The symbols itself are always shared.

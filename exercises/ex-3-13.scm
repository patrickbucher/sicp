(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;; The following structure is created:
;;  v---------------\
;; [a| ]->[b| ]->[c| ]

;; (car z)
;; a
;; (cadr z)
;; b
;; (caddr z)
;; c
;; (cadddr z)
;; a

;; (last-pair z)
;; [infinite loop]

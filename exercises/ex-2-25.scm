(define a (list 1 3 (list 5 7) 9))

(define b (list (list 7)))

(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

;; (car (cdr (car (cdr (cdr a)))))
;; 7
;; (car (cdaddr a))
;; 7

;; (car (car b))
;; 7
;; (caar b)
;; 7

;; (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c))))))))))))
;; 7
;; (cadadr (cadadr (cadadr c)))
;; 7

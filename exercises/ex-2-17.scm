(define (last-pair xs)
  (if (null? (cdr xs))
      (list (car xs))
      (last-pair (cdr xs))))

;; (last-pair (list 1 2 3 4 5))
;; (5)

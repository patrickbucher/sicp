(define nil '())

(define (for-each proc items)
  (define (next items)
    (proc (car items))
    (for-each proc (cdr items)))
  (if (null? items)
      nil
      (next items)))

;; (for-each (lambda (x) (display x) (newline)) (list 1 2 3 4))
;; 1
;; 2
;; 3
;; 4

      

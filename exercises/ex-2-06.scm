;; zero: a function that returns the identity function
(define zero (lambda (f) (lambda (x) x)))

;; add-one: a function that returns a function
;; x
;; (f ((n f) x))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-one zero)
;; (lambda (f) (lambda (x) (f ((n f) x))))
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x)) f) x)))
;; (lambda (f) (lambda 

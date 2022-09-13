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

;; evaluate from the inside out:
;; (zero f)
;; zero: rename f -> g, x -> y for clarity
;; (define (zero (lambda (g) (lambda (y) y))))
;; ((lambda (g) (lambda (y) y)) f)
;; (lambda (y) y)

;; put back in (lambda (y) y) for (zero f)
;; (lambda (f) (lambda (x) (f ((lambda (y) y) x))))

;; evaluate from the inside out:
;; ((lambda (y) y) x)
;; x

;; put back in
;; (lambda (f) (lambda (x) (f x)))

;; definitions:
;; zero
;; (lambda (f) (lambda (x) x))
;; (add-1 zero): one
;; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;; (add-1 (add-1 zero))
;; (add-1 one)
;; (lambda (f) (lambda (x) (f ((n f) x)))
;; (lambda (f) (lambda (x) (f ((one f) x))))

;; evaluate from the inside out:
;; (one f)
;; one: rename f -> g, x -> y for clarity
;; (define one (lambda (g) (lambda (y) (g y))))
;; ((lambda (g) (lambda (y) (g y))) f)
;; (lambda (y) (f y))

;; put back in (lambda (y) (f y)) for (one f)
;; (lambda (f) (lambda (x) (f ((lambda (y) (f y)) x))))

;; evaluate from the inside out:
;; (f ((lambda (y) (f y)) x))
;; (f (f x))

;; put back in
;; (lambda (f) (lambda (x) (f (f x)))

(define two (lambda (f) (lambda (x) (f (f x)))))

;; one: (f x)
;; two: (f (f x))
;; three: (f (f (f x)))
;; one + two: compose a and b
(define (add a b)
  (lambda (x) (a (b x))))

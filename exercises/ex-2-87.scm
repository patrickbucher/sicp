(load "examples/polynomials.scm")

;; internal procedures (extracted from polynomials.scm)
(define (term-list p) (cdr p))
(define (empty-termlist? term-list) (null? term-list))
(define (first-term term-list) (car term-list))
(define (rest-terms term-list) (cdr term-list))
(define (coeff term) (cadr term))

(define (=zero? poly)
  (define (all-terms-zero? terms)
    (if (empty-termlist? terms)
	#t
	(let ((head (first-term terms))
	      (tail (rest-terms terms)))
	  (if (not (= (coeff head) 0))
	      #f
	      (all-terms-zero? tail)))))
  (let ((terms (term-list poly)))
    (all-terms-zero? terms)))

(define (install-zero-predicate)
  (put '=zero? '(polynomial) =zero?)
  'done)

(install-zero-predicate)

(define zero-1 ((get 'make 'polynomial) 'x '((3 0) (2 0) (1 0) (0 0))))
(define zero-2 ((get 'make 'polynomial) 'x '()))
(define non-zero ((get 'make 'polynomial) 'x '((3 1) (2 0) (1 3) (0 5))))

;; (apply-generic '=zero? zero-1)
;; #t
;; (apply-generic '=zero? zero-2)
;; #t
;; (apply-generic '=zero? non-zero)
;; #f

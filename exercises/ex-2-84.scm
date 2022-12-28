(load "exercises/ex-2-83.scm")

(define (higher? this that)
  (define (get-level type tower level)
    (if (null? tower)
	(error (string "unable to find level for type " type))
	(let ((lowest (car tower))
	      (remainder (cdr tower)))
	  (if (eq? lowest type)
	      level
	      (get-level type remainder (+ level 1))))))
  (if (null? that)
      #t
      (let ((this-level (get-level this type-tower 0))
	    (that-level (get-level that type-tower 0)))
	(> this-level that-level))))

(define (find-highest types)
  (define (next types highest)
    (if (null? types)
	highest
	(let ((head (car types))
	      (tail (cdr types)))
	  (if (higher? head highest)
	      (next tail head)
	      (next tail highest)))))
  (next types '()))

(define (apply-generic op . args)
  (define (get-tag arg) (car arg))
  (let ((types (map get-tag args)))
    (let ((highest-type (find-highest types)))
      (display highest-type)
      (newline))))
;; TODO: raise all to highest

(define a (cons 'integer 3))
(define b (cons 'rational (cons 3 2)))
(define c (cons 'real (/ 4 5)))
(define d (cons 'complex (cons 2 3)))

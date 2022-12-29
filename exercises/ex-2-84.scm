(load "examples/op-type-table.scm")
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

(define (raise-all to-type values)
  (define (raise-next values acc)
    (if (null? values)
	acc
	(let ((head (car values))
	      (tail (cdr values)))
	  (raise-next tail (append acc (list (raise head to-type)))))))
  (raise-next values '()))

(define (repeat x n)
  (define (next i acc)
    (if (<= i 0)
	acc
	(next (- i 1) (cons x acc))))
  (next n '()))

(define (apply-generic op . args)
  (define (get-tag arg) (car arg))
  (let ((types (map get-tag args)))
    (let ((highest-type (find-highest types)))
      (let ((raised (raise-all highest-type args))
	    (new-types (repeat highest-type (length args))))
	(let ((proc (get op new-types)))
	  (if proc
	      (apply proc raised)
	      (error (string "no proc found for op:" op " and types:" new-types))))))))

(define a (cons 'integer 3))
(define b (cons 'rational (cons 3 2)))
(define c (cons 'real (/ 4 5)))
(define d (cons 'complex (cons 2 3)))

(put 'add '(real real)
     (lambda (x y)
       (let ((vx (cdr x))
	     (vy (cdr y)))
	 (cons 'real (+ vx vy)))))

;; (apply-generic 'add a c)
;; (real . 3.8)

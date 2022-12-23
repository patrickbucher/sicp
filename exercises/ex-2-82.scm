(load "examples/coercion-table.scm")

(define (any? pred vals)
  (if (null? vals)
      #f
      (if (pred (car vals))
	  #t
	  (any? pred (cdr vals)))))

(define (coerce-all coercions args)
  (define (coerce-next acc coercs args)
    (if (null? coercs)
	acc
	(let ((c (car coercs))
	      (a (car args))
	      (cs (cdr coercs))
	      (as (cdr args)))
	  (coerce-next (append acc (list (c a))) cs as))))
  (if (not (= (length coercions) (length args)))
      (error "different number of coercions and args")
      (coerce-next '() coercions args)))

(define (repeat val n)
  (define (next acc i)
    (if (= i 0)
	acc
	(next (cons val acc) (- i 1))))
  (next '() n))

(define (apply-generic op . args)
  (define (type-tag arg) (car arg))
  (define (contents arg) (cdr arg))
  (define (try-next-coercion args types-left)
    (if (null? types-left)
	(error "no common coercion found")
	(let ((coerce-into (car types-left))
	      (types (map type-tag args)))
	  (let ((coercions
		 (map (lambda (from-type)
			(get-coercion from-type coerce-into)) types)))
	    (if (any? (lambda (x) (eq? x #f)) coercions)
		(try-next-coercion args (cdr types-left))
		(let ((coerced-args (coerce-all coercions args))
		      (coerced-types (repeat coerce-into (length args))))
		  (let ((proc (get op coerced-types)))
		    (if proc
			(apply proc coerced-args)
			(try-next-coercion args (cdr types-left))))))))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (try-next-coercion args type-tags)))))

(define a (cons 'foo 3))
(define b (cons 'bar 4))

(define add-foos (lambda (x y) (cons 'foo (+ (cdr x) (cdr y)))))
(put 'add '(foo foo) add-foos)

(define bar->foo (lambda (x) (cons 'foo (cdr x))))
(put-coercion 'bar 'foo bar->foo)

;; (apply-generic 'add a b)
;; (foo . 7)

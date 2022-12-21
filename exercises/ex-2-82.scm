(load "examples/coercion-table.scm")

(define (any? pred vals)
  (if (null? vals)
      #f
      (if (pred (car vals))
	  #t
	  (any? pred (cdr vals)))))

(define (coerce-all coercions values)
  (define (coerce-next acc coercs vals)
    (if (null? coercs)
	acc
        (coerce-next (append acc (list ((car coercs) (car vals))))
		     (cdr coercs)
		     (cdr vals))))
  (if (not (= (length (coercions)) (length (values))))
      (error "different number of coercions and values")
      (coerce-next '() coercions values)))

(define (repeat val n)
  (define (next acc i)
    (if (= i 0)
	acc
	(repeat (cons val acc) (- i 1))))
  (next '() n))

(define (apply-generic op . args)
  (define (type-tag arg) (car arg))
  (define (contents arg) (cdr arg))
  (define (find-next-coercion args types-left)
    (if (null? types-left)
	(error "no common coercion found")
	(let ((coerce-into (car types-left))
	      (types (map type-tag args))
	      (values (map contents args)))
	  (let ((coercions
		(map (lambda (from-type)
		       (get-coercion from-type coerce-into)) types)))
	    (if (any? (lambda (x) (eq? x #f)) vals)
		(find-next-coercion args (cdr types-left))
		(let ((coerced-values (coerce-all coercions values)))
		  (let ((proc (get op (repeat coerce-into (length args)))))
		    (error "NOT IMPLEMENTED YET"))))))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (error "NOT IMPLEMENTED YET")))))
	  

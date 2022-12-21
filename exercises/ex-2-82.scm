(load "examples/coercion-table.scm")

(define (any? pred vals)
  (if (null? vals)
      #f
      (if (pred (car vals))
	  #t
	  (any? pred (cdr vals)))))

(define (apply-generic op . args)
  (define (type-tag arg) (car arg))
  (define (contents arg) (cdr arg))
  (define (coerce-next args types-left)
    (if (null? types-left)
	(error "no common coercion found")
	(let ((coerce-into (car types-left))
	      (types (map type-tag args))
	      (values (map contents args)))
	  (let ((coercions
		(map (lambda (from-type)
		       (get-coercion from-type coerce-into)) types)))
	    (if (any? (lambda (x) (eq? x #f)) vals)
		(coerce-next args (cdr types-left))
		;; TODO: perform coercions, try to find procedure
		(error "NOT IMPLEMENTED YET"))))))
  (let (type-tags (map type-tag args))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (error "NOT IMPLEMENTED YET")))))
	  

(define (raise value to-type)
  (define (tag type value) (cons type value))
  (define (get-tag x) (car x))
  (define (get-value x) (cdr x))
  (define types '(integer rational real complex))
  (define coercions
    (list (cons (cons 'integer 'rational)
		(lambda (x) (tag 'rational (cons (get-value x) 1.0))))
	  (cons (cons 'rational 'real)
		(lambda (x) (tag 'real (/ (car (get-value x)) (cdr (get-value x))))))
	  (cons (cons 'real 'complex)
		(lambda (x) (tag 'complex (cons (get-value x) 0))))))
  ;; TODO: find coercion by type and perform it
  )
		     
  


(define (raise value to-type)
  (define (set-tag type value) (cons type value))
  (define (get-tag x) (car x))
  (define (get-value x) (cdr x))
  (define types '(integer rational real complex))
  (define coercions
    (list (cons (cons 'integer 'rational)
		(lambda (x) (set-tag 'rational (cons (get-value x) 1.0))))
	  (cons (cons 'rational 'real)
		(lambda (x) (set-tag 'real (/ (car (get-value x)) (cdr (get-value x))))))
	  (cons (cons 'real 'complex)
		(lambda (x) (set-tag 'complex (cons (get-value x) 0))))))
  (define (raise-next value coercions)
    (cond ((eq? (get-tag value) to-type) value)
	  ((null? coercions) (error "no coercion found"))
	  (else
	   (let ((current-type (get-tag value)))
	     (let ((next-coercion (car coercions))
		   (remaining-coercions (cdr coercions)))
	       ;; TODO: check coercion for source type...?
	       (let ((new-value ((cadr next-coercion) value)))
		 (raise-next new-value remaining-coercions)))))))
  (raise-next value coercions))

(define a '('integer 3))
;; (raise a 'rational)


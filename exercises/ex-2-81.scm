(load "examples/coercion-table.scm")

(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)

(put-coercion 'scheme-number 'scheme-number
	      scheme-number->scheme-number)

(put-coercion 'complex 'complex
	      complex->complex)


;; 1)

(define (exp x y)
  (apply-generic 'exp x y))

(put 'exp
     '(scheme-number scheme-number)
     (lambda (x y)
       (tag (expt x y))))

(define (tag x)
  (list 'scheme-number x))

;; Since no operation supporting complex numbers is found in the
;; operation/type table, coercions are looked up, and one is found. The
;; arguments are converted to themselves, and `apply-generic` is applied
;; again, failing to find an appropriate procedure once more. Another
;; round of coercion is done to the same type, which leads to an infinite
;; call to `apply-generic`.


;; 2)

;; There's no need to coerce values into their own type. If no
;; procedure for a type is found, no amount "self-coercion" will solve
;; that issue.

(define (apply-generic op . args)
  (define (type-tag arg) (car arg))
  (define (contents arg) (cdr arg))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (= (length args) 2)
	      (let ((type1 (car type-tags))
		    (type2 (cadr type-tags))
		    (a1 (car args))
		    (a2 (cadr args)))
		(if (eq? type1 type2)
		    (error
		     "No method for these types"
		     (list op type-tags))
		    (let ((t1->t2
			   (get-coercion type1 type2))
			  (t2->t1
			   (get-coercion type2 type1)))
		      (cond (t1->t2
			     (apply-generic
			      op (t1->t2 a1) a2))
			    (t2->t1
			     (apply-generic
			      op (t2->t1 a2)))
			    (else
			     (error
			      "No method for these types"
			      (list op type-tags))))))
		(error
		 "No method for these types"
		 (list op type-tags))))))))


(define coercion-table '())

(define (make-key src-type dst-type) (cons src-type dst-type))

(define (get-src-type key) (car key))

(define (get-dst-type key) (cdr key))

(define (same-key? a b)
  (and (eq? (get-src-type a) (get-src-type b))
       (eq? (get-dst-type a) (get-dst-type b))))

(define (make-pair key proc) (cons key proc))

(define (get-pair-key pair) (car pair))

(define (get-pair-value pair) (cdr pair))

(define (put-coercion src-type dst-type proc)
  (let ((key (make-key src-type dst-type)))
    (define (different-key? pair)
      (let ((pair-key (get-pair-key pair)))
	(not (same-key? pair-key key))))
    (set! coercion-table
	  (append (filter different-key? coercion-table)
		  (list (make-pair key proc))))))

(define (get-coercion src-type dst-type)
  (define (identity x) x)
  (if (eq? src-type dst-type)
      identity
      (let ((key (make-key src-type dst-type)))
	(define (has-same-key? pair)
	  (let ((pair-key (get-pair-key pair)))
	    (same-key? pair-key key)))
	(let ((found (filter has-same-key? coercion-table)))
	  (if (null? found)
	      #f
	      (cdar found))))))

(load "examples/op-type-table.scm")

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
	       (list op type-tags)))))))


;; (put 'mul '(scheme-number scheme-number) (lambda (x y) (* (car x) (car y))))
;; (apply-generic 'mul '(scheme-number 3) '(scheme-number 2))
;; 6

;; (put 'mul '(rational rational) (lambda (x y) (cons (* (car x) (car y)) (* (cadr x) (cadr y)))))
;; (apply-generic 'mul '(rational 2 3) '(rational 3 2))
;; (6 . 6)

;; (put-coercion 'scheme-number 'rational (lambda (x) (list 'rational (cadr x) 1)))
;; (apply-generic 'mul '(scheme-number 3) '(rational 3 2))
;; (9 . 2)

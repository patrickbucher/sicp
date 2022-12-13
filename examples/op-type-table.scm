;; constructors and accessors (internal procedures)

(define (make-key op type)
  (cons op type))

(define (get-key-op key)
  (car key))

(define (get-key-type key)
  (cdr key))

(define (same-key? this that)
  (let ((this-op (get-key-op this))
	(that-op (get-key-op that))
	(this-type (get-key-type this))
	(that-type (get-key-type that)))
    (and (eq? this-op that-op)
	 (cond ((and (list? this-type) (list? that-type))
		(equal? this-type that-type))
	       ((and (symbol? this-type) (symbol? that-type))
		(eq? this-type that-type))
	       (else #f)))))

(define (make-pair key value)
  (cons key value))

(define (get-pair-key pair)
  (car pair))

(define (get-pair-value pair)
  (cdr pair))


;; the global table

(define table '())


;; table operations put and get

(define (put op type item)
  (define (insert left right pair)
    (if (null? right)
	(append left (list pair))
	(let ((current (car right)))
	  (let ((new-key (get-pair-key pair))
		(new-value (get-pair-value pair))
		(current-key (get-pair-key current)))
	    (if (same-key? current-key new-key)
		(append left
			(make-pair current-key new-value)
			(cdr right))
		(insert (append left (list current))
			(cdr right)
			pair))))))
  (let ((key (make-key op type)))
    (let ((pair (make-pair key item)))
      (if (null? table)
	  (set! table (list pair))
	  (set! table (insert table '() pair))))))

(define (get op type)
  (define (get-from table op type)
    (let ((key (make-key op type)))
      (if (null? table)
	  #f
	  (let ((current (car table)))
	    (let ((current-key (get-pair-key current)))
	      (if (same-key? current-key key)
		  (get-pair-value current)
		  (get-from (cdr table) op type)))))))
  (get-from table op type))


;; compound type tags:
;; (put 'add '(number number) (lambda (x y) (+ x y)))
;; (put 'add '(string string) (lambda (x y) (string x y)))
;; (put 'sub '(number number) (lambda (x y) (- x y)))
;; ((get 'add '(number number)) 3 4)
;; 7
;; ((get 'add '(string string)) "foo" "bar")
;; "foobar"
;; ((get 'sub '(number number)) 7 3)
;; 4


(define (apply-generic op . args)
  (define (type-tag arg) (car arg))
  (define (contents arg) (cadr arg))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (error "No method for these types: APPLY-GENERIC"
		 (list op type-tags))))))

;; (apply-generic 'add (list 'number 3) (list 'number 4))
;; 7
;; (apply-generic 'add (list 'string "foo") (list 'string "bar"))
;; "foobar"
;; (apply-generic 'sub (list 'number 7) (list 'number 4))
;; 3


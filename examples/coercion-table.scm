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
  (let ((key (make-key src-type dst-type)))
    (define (has-same-key? pair)
      (let ((pair-key (get-pair-key pair)))
	(same-key? pair-key key)))
    (let ((found (filter has-same-key? coercion-table)))
      (if (null? found)
	  (error "no coercion found for " key)
	  (car found)))))


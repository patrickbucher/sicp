;; constructors and accessors

(define (make-key op type)
  (cons op type))

(define (get-key-op key)
  (car key))

(define (get-key-type key)
  (cdr key))

(define (same-key? this that)
  (and (eq? (car this) (car that))
       (eq? (cdr this) (cdr that))))

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


;; demonstration

;; (put + 'number 'add-numbers)
;; (put + 'string 'concat-strings)
;; (get + 'number)
;; add-numbers
;; (get + 'string)
;; concat-strings

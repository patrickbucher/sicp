(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) #f)
	    ((same-key? key (caar records)) (car records))
	    (else (assoc key (cdr records)))))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (cdr record)
		  #f))
	    #f)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (set-cdr! record value)
		  (set-cdr! subtable
			    (cons (cons key-2 value)
				  (cdr subtable)))))
	    (set-cdr! local-table
		      (cons (list key-1
				  (cons key-2 value))
			    (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define (close-enough? a b)
  (< (abs (- b a)) 0.01))

(define operation-table (make-table close-enough?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(put 1 1 'one-one)
(put 1 2 'one-two)
(put 2 1 'two-one)
(put 2 2 'two-two)
;; (get 1 1)
;; one-one
;; (get 1 2)
;; one-two
;; (get 2 1)
;; two-one
;; (get 2 2)
;; two-two
;; (get 1.00001 0.9999)
;; one-one

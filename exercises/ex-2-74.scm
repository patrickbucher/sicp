;; 1)

;; 'list-emp is a list implementation of the employee record.
(define (make-list-emp name address salary)
  (list 'list-emp name address salary))

(define (get-list-emp-name record) (cadr record))
(define (get-list-emp-salary record) (cadddr record))

;; 'pair-emp is a pair implementation of the employee record.
(define (make-pair-emp name address salary)
  (list 'pair-emp
	(cons 'name name)
	(cons 'addr address)
	(cons 'slry salary)))

(define (get-pair-emp-name record)
  (get-pair-emp-field record 'name))

(define (get-pair-emp-salary record)
  (get-pair-emp-field record 'slry))

(define (get-pair-emp-field record field-key)
  (define (next pairs)
    (if (null? pairs)
	#f
	(let ((pair (car pairs)))
	  (let ((key (car pair))
		(val (cdr pair)))
	    (if (eq? key field-key)
		val
		(next (cdr pairs)))))))
  (next (cdr record)))

;; list-file stores the employees as a list.
(define list-file
  (cons 'list-file
	(list
	 (make-list-emp "Dilbert"
			"123 Nerd Drive"
			120000)
	 (make-list-emp "Wally"
			"823 Lazy Way"
			115000)
	 (make-list-emp "Alice"
			"Road of Ambition"
			130000))))

;; pair-file stores employees with a special key.
(define pair-file
  (cons 'pair-file
	(list
	 (cons 'boss
	       (make-pair-emp "Pointy-Haired Boss"
			      "Success Road"
			      180000))
	 (cons 'dogbert
	       (make-pair-emp "Dogbert"
			      "123 Nerd Drive"
			      190000))
	 (cons 'catbert
	       (make-pair-emp "Catbert"
			      "Meow Hills"
			      230000)))))

(define (get-record file key)
  (let ((tag (car file))
	(entries (cdr file)))
    (cond ((eq? tag 'list-file) (get-list-file-record entries key))
	  ((eq? tag 'pair-file) (get-pair-file-record entries key))
	  (else '()))))

(define (get-list-file-record entries key)
  (if (null? entries)
      '()
      (let ((record (car entries)))
	(let ((record-name (get-list-emp-name record)))
	  (if (equal? record-name key)
	      record
	      (get-list-file-record (cdr entries) key))))))

(define (get-pair-file-record entries key)
  (if (null? entries)
      '()
      (let ((key-value-pair (car entries)))
	(let ((record-key (car key-value-pair))
     	      (record-val (cdr key-value-pair)))
	  (if (eq? record-key key)
	      record-val
	      (get-pair-file-record (cdr entries) key))))))

;; (get-record list-file "Dilbert")
;; (list-emp "Dilbert" "123 Nerd Drive" 120000)
;; (get-record pair-file 'boss)
;; (pair-emp (name . "Pointy-Haired Boss") (addr . "Success Road") (slry . 180000))


;; 2)
(define (get-salary file key)
  (let ((tag (car file))
	(record (get-record file key)))
    (if (null? record)
	#f
	(cond ((eq? tag 'list-file)
	       (get-list-emp-salary record))
	      ((eq? tag 'pair-file)
	       (get-pair-emp-salary record))
	      (else #f)))))

;; (get-salary list-file "Wally")
;; 115000
;; (get-salary pair-file 'dogbert)
;; 190000

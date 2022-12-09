;; 1)

;; 'list-emp is a list implementation of the employee record.
(define (make-list-emp name address salary)
  (list 'list-emp name address salary))

;; 'pair-emp is a pair implementation of the employee record.
(define (make-pair-emp name address salary)
  (list 'pair-emp
	(cons 'name name)
	(cons 'addr address)
	(cons 'slry salary)))

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
			      "Success Roead"
			      180000))
	 (cons 'dogbert
	       (make-pair-emp "Dogbert"
			      "123 Nerd Drive"
			      190000))
	 (cons 'catbert
	       (make-pair-emp "Catberg"
			      "Meow Hills"
			      230000)))))

;; TODO: implement
(define (get-record file name)
  (let ((tag (car file))
	(entries (cdr file)))
    (cond ((eq? tag 'list-file) '())
	  ((eq? tag 'pair-file) '())
	  (else #f))))

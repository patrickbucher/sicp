(define (make-deque)
  (cons '() '()))

(define (front-ptr q) (car q))
(define (rear-ptr q) (cdr q))

(define (empty-deque? q)
  (null? (front-ptr q)))

(define (front-deque q)
  (if (empty-deque? q)
      (error "empty deque")
      (car (front-ptr q))))

(define (rear-deque q)
  (if (empty-deque? q)
      (error "empty deque")
      (car (rear-ptr q))))

(define (front-insert-deque! q v)
  (if (empty-deque? q)
      (let ((e (cons v '())))
	(set-car! q e)
	(set-cdr! q e)
	q)
      (let ((e (cons v (front-ptr q))))
	(set-car! q e)
	q)))

(define (rear-insert-deque! q v)
  (let ((e (cons v '())))
    (if (empty-deque? q)
	(begin
	  (set-car! q e)
	  (set-cdr! q e)
	  q)
	(begin
	  (set-cdr! (rear-ptr q) e)
	  (set-cdr! q e)
	  q))))

(define (front-delete-deque! q)
  (cond ((empty-deque? q)
	 (error "cannot delete from empty deque"))
	((eq? (front-ptr q) (rear-ptr q))
	 (begin
	   (set-car! q '())
	   (set-cdr! q '())
	   q))
	(else
	 (let ((new-front (cdr (front-ptr q))))
	   (set-car! q new-front)
	   q))))

(define (rear-delete-deque! q)
  (cond ((empty-deque? q)
	 (error "cannot delete from empty deque"))
	((eq? (front-ptr q) (rear-ptr q))
	 (begin
	   (set-car! q '())
	   (set-cdr! q '())
	   q))
	(else
	 ;; NOTE: this is not O(1), but O(n).
	 ;; O(1) would require a double-linked list.
	 (let ((new-rear (find-pointing-to (front-ptr q) (rear-ptr q))))
	   (set-cdr! q new-rear)
	   (set-cdr! new-rear '())
	   q))))

(define (find-pointing-to cell to-next)
  (if (eq? (cdr cell) to-next)
      cell
      (find-pointing-to (cdr cell) to-next)))

(define (unroll q)
  (define (next front acc)
    (if (null? front)
	acc
	(next (cdr front) (cons (car front) acc))))
  (reverse (next (front-ptr q) '())))

;; (define numbers (make-deque))
;; (front-insert-deque! numbers 5)
;; (front-insert-deque! numbers 4)
;; (front-insert-deque! numbers 3)
;; (front-insert-deque! numbers 1)
;; (front-delete-deque! numbers)
;; (front-insert-deque! numbers 2)
;; (front-insert-deque! numbers 1)
;; (rear-insert-deque! numbers 6)
;; (rear-insert-deque! numbers 7)
;; (rear-insert-deque! numbers 9)
;; (rear-delete-deque! numbers)
;; (rear-insert-deque! numbers 8)
;; (unroll numbers)
;; (1 2 3 4 5 6 7 8)

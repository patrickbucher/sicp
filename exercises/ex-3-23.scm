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
      (error "emptu deque")
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

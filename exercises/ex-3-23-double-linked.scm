(define (make-cell val prev next) (cons val (cons prev next)))
(define (cell-val c) (car c))
(define (cell-prev c) (cadr c))
(define (cell-next c) (cddr c))
(define (cell-set-prev c p) (set-car! (cdr c) p))
(define (cell-set-next c n) (set-cdr! (cdr c) n))

(define (make-deque) (cons '() '()))
(define (front-ptr q) (car q))
(define (rear-ptr q) (cdr q))
(define (empty-deque? q) (null? (front-ptr q)))

(define (front-deque q)
  (if (empty-deque? q)
      (error "empty deque")
      (cell-val (front-ptr q))))

(define (rear-deque q)
  (if (empty-deque? q)
      (error "empty deque")
      (cell-val (rear-ptr q))))

(define (front-insert-deque! q v)
  (if (empty-deque? q)
      (let ((e (make-cell v '() '())))
	(set-car! q e)
	(set-cdr! q e)
	q)
      (let ((e (make-cell v '() (front-ptr q))))
	(set-car! q e)
	q)))

(define (rear-insert-deque! q v)
  (if (empty-deque? q)
      (let ((e (make-cell v '() '())))
	(set-car! q e)
	(set-cdr! q e)
	q)
      (let ((e (make-cell v (rear-ptr q) '())))
	;; TODO
	)))

(define (unroll q)
  (define (next front-ptr acc)
    (if (null? front-ptr)
	acc
	(next (cell-next front-ptr) (cons (cell-val front-ptr) acc))))
  (reverse (next (front-ptr q) '())))

;; TODO
;; front-insert-deque!
;; rear-insert-deque!
;; front-delete-deque!
;; rear-delete-deque!
;; unroll

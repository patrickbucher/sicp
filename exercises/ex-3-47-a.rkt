(load "lib/concurrency.rkt")

(define (enumerate n)
  (define (next i acc)
    (if (< i 1)
	acc
	(next (- i 1) (cons i acc))))
  (next n '()))

(define (mutex-semaphore n)
  (if (< n 1)
      (error "cannot create semaphore of size" n)
      ;; TODO: mutexes to hash
      (let ((mutexes ((foldl (lambda (x acc)
			      (append acc (list x (make-mutex))))
			    '()
			    (enumerate n)))))
	(define (dispatch message)
	  (cond ((eq? message 'acquire) false)
		((eq? message 'relese) false)
		(else (error "unknown message" message))))
	dispatch)))

(define (new-stack)
  (let ((stack '()))
    (define (push x)
      (set! stack (cons x stack)))
    (define (pop)
      (if (null? stack)
	  (error "stack is empty")
	  (begin
	    (let ((tip (car stack)))
	      (set! stack (cdr stack))
	      tip))))
    (define (dispatch message)
      (cond ((eq? message 'push) push)
	    ((eq? message 'pop) pop)
	    (else (error "unknown operation" message))))
    dispatch))



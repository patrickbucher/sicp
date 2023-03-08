(load "lib/concurrency.rkt")

(define (enumerate n)
  (define (next i acc)
    (if (< i 1)
	acc
	(next (- i 1) (cons i acc))))
  (next n '()))

(define (to-hash paired)
  (define (next rest acc)
    (cond ((null? rest) acc)
	  ((null? (cdr rest)) (error "remainder is not a pair"))
	  (else
	   (let ((key (car rest))
		 (value (cadr rest))
		 (rest (cddr rest)))
	     (next rest (hash-set acc key value))))))
  (next paired (make-immutable-hash)))

(define (make-semaphore n)
  (if (< n 1)
      (error "cannot create semaphore of size" n)
      (let ((pairs (to-hash
		    (foldl (lambda (x acc) (append acc
						   (list x
							 (list (make-mutex)
							       (make-stack)))))
			   '()
			   (enumerate n)))))
	(define (dispatch message)
	  (cond ((eq? message 'acquire) false)
		((eq? message 'release) false)
		(else (error "unknown message" message))))
	dispatch)))

(define (make-stack)
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



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
      (let ((mutexes (map (lambda (_) (make-mutex))
			  (enumerate n))))
	(define (dispatch message)
	  (cond ((eq? message 'acquire)
		 (let ((free (filter (lambda ;; TODO
		((eq? message 'relese) false)
		(else (error "unknown message" message))))
	dispatch)))

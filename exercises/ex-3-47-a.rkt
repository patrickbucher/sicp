(load "lib/concurrency.rkt")

(define (enumerate n)
  (define (next i acc)
    (if (< i 0)
	acc
	(next (- i 1) (cons i acc))))
  (next n '()))

(define (make-semaphore n)
  (if (< n 1)
      (error "cannot create semaphore of size" n)
      (let ((mutexes (foldl (lambda (i acc) (append acc (list (list i (make-mutex)))))
			    '()
			    (enumerate (- n 1)))))
	(define (dispatch message)
	  (cond ((eq? message 'acquire)
		 (let ((available
			(filter (lambda (p)
				  (let ((mux (cadr p)))
				    (mux 'free?)))
				mutexes)))
		   (if (null? available)
		       #f
		       (let ((mux (cadar available)))
			 (mux 'acquire)
			 (- (length available) 1)))))
		((eq? message 'release)
		 (let ((acquired
			(filter (lambda (p)
				  (let ((mux (cadr p)))
				    (not (mux 'free?))))
				mutexes)))
		   (if (null? acquired)
		       #f
		       (let ((mux (cadar acquired)))
			 (mux 'release)
			 (+ (- n (length acquired)) 1)))))
		(else (error "unknown message" message))))
	dispatch)))


;; (define sema (make-semaphore 4))
;; (sema 'acquire)
;; 3
;; (sema 'acquire)
;; 2
;; (sema 'acquire)
;; 1
;; (sema 'acquire)
;; 0
;; (sema 'acquire)
;; #f
;; (sema 'release)
;; 1
;; (sema 'release)
;; 2
;; (sema 'release)
;; 3
;; (sema 'release)
;; 4
;; (sema 'release)
;; 5

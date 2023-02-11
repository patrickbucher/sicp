(define (contains-cycle? items)
  (let ((cache '()))
    (define (cache-add elem)
      (begin
	(set! cache (append cache (list elem)))
	cache))
    (define (cache-contains? elem)
      (define (next items)
	(if (null? items)
	    #f
	    (if (eq? elem (car items))
		#t
		(next (cdr items)))))
      (next cache))
    (define (next items)
      (if (null? items)
	  #f
	  (let ((head (car items)))
	    (if (cache-contains? head)
		#t
		(begin
		  (cache-add head)
		  (next (cdr items)))))))
    (next items)))

(define regular '(a b c d))
;; (contains-cycle? regular)
;; #f

(define cycled '(a b c d))
(set-cdr! (cddr cycled) cycled)
;; #t


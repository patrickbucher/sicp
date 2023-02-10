(define (make-cache items)
  (define (contains? x)
    (define (next e elems)
      (if (null? elems)
	  #f
	  (if (eq? e (car elems))
	      #t
	      (next e (cdr elems)))))
    (next x items))
  (define (add x)
    (begin
      (set! items (append items (list x)))
      items))
  (lambda (msg)
    (cond ((eq? msg 'add) add)
	  ((eq? msg 'contains?) contains?)
	  (else (error "unknown message:" msg)))))

(define (count-pairs x)
  (let ((cache (make-cache '())))
    (define (iter items)
      (cond ((not (pair? items)) 0)
	    (((cache 'contains?) items) 0)
	    (else
	     (begin
	       ((cache 'add) items)
	       (+ (iter (car items))
		  (iter (cdr items))
		  1)))))
    (iter x)))

(define regular-list (list 'a 'b 'c 'd 'e))
;; (count-pairs regular-list)
;; 5

(define cell-structure (cons (cons 'a (cons 'b '())) (cons 'c (cons 'd '()))))
;; (count-pairs cell-structure)
;; 5

;; Problematic examples from exercise 3.16:

(define a (cons 'a '()))
(define b (cons 'b '()))
(define c (cons 'c '()))
(set-car! a b)
(set-cdr! a c)
(set-cdr! c b)
;; (count-pairs a)
;; 3

(define x (cons 'x '()))
(define y (cons 'y '()))
(define z (cons 'z '()))
(set-car! x y)
(set-cdr! x y)
(set-car! y z)
(set-cdr! y z)
;; (count-pairs x)
;; 3

(define infinite '(a b c))
(set-cdr! (cddr infinite) infinite)
;; (count-pairs infinite)
;; 3

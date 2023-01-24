(load "exercises/ex-2-90.scm")
(load "lib/functools.scm") ;; all-eq?

(define (install-rational-package)
  ;; internal procedures
  (define (make-rational dividend divisor)
    (tag (list dividend divisor)))
  (define (add-rf rf1 rf2)
    (let ((dividend1 (car rf1))
	  (dividend2 (car rf2))
	  (divisor1 (cadr rf1))
	  (divisor2 (cadr rf2)))
      (let ((var-dividend1 (cadr dividend1))
	    (var-dividend2 (cadr dividend2))
	    (var-divisor1 (cadr divisor1))
	    (var-divisor2 (cadr divisor2)))
	(if (not (all-eq? (list var-dividend1 var-dividend2 var-divisor1 var-divisor2)))
	    (error "cannot add rationals of different variables")
	    (let ((tl-dividend1 (cddr dividend1))
		  (tl-dividend2 (cddr dividend2))
		  (tl-divisor1 (cddr divisor1))
		  (tl-divisor2 (cddr divisor2)))
	      (let ((new-divisor (apply-generic 'mul tl-divisor1 tl-divisor2)))
		(let ((new-dividend
		       (apply-generic 'add
				      (apply-generic 'mul new-divisor tl-dividend1)
				      (apply-generic 'mul new-divisor tl-dividend2))))
		  ;; TODO: properly tag as polynomial
		  (make-rational new-dividend new-divisor))))))))
  ;; type system
  (define (tag data)
    (cons 'ratfunc data))
  (define (dividend rf) (car rf))
  (define (divisor rf) (cdr rf))
  ;; generic procedures
  (put 'make 'ratfunc (lambda (dividend divisor) (make-rational dividend divisor)))
  (put 'add '(ratfunc ratfunc) (lambda (rf1 rf2) (add-rf rf1 rf2)))
  (put 'sub '(ratfunc ratfunc) (lambda (rf1 rf2) (sub-rf rf1 rf2)))
  (put 'mul '(ratfunc ratfunc) (lambda (rf1 rf2) (mul-rf rf1 rf2)))
  (put 'div '(ratfunc ratfunc) (lambda (rf1 rf2) (div-rf rf1 rf2)))
  ;; TODO: make
  'done)

(install-rational-package)

(define c1 ((get 'make 'counted) '((2 1) (0 1))))
(define c2 ((get 'make 'counted) '((3 1) (0 1))))
(define p1 ((get 'make 'polynomial) 'x c1))
(define p2 ((get 'make 'polynomial) 'x c2))

(define rf ((get 'make 'ratfunc) p1 p2))

;; (apply-generic 'add rf rf)

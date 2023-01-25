(load "exercises/ex-2-90.scm")
(load "lib/functools.scm") ;; all-eq?

(define (combine-rationals rf1 rf2 op)
  (define (to-rf var rfs)
    (let ((rf1 (car rfs))
	  (rf2 (cadr rfs)))
      (let ((new-rf1 (cons 'polynomial (cons var rf1)))
	    (new-rf2 (cons 'polynomial (cons var rf2))))
      (cons 'ratfunc (list new-rf1 new-rf2)))))
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
	    (to-rf var-dividend1 (op tl-dividend1 tl-divisor1 tl-dividend2 tl-divisor2)))))))

(define (install-rational-package)
  ;; internal procedures
  (define (make-rational dividend divisor)
    (tag (list dividend divisor)))
  (define (add-rf rf1 rf2)
    (combine-rationals rf1
		       rf2
		       (lambda (dvd1 dvs1 dvd2 dvs2)
			 (list (apply-generic 'add
					      (apply-generic 'mul dvd1 dvs2)
					      (apply-generic 'mul dvd2 dvs1))
			       (apply-generic 'mul dvs1 dvs2)))))
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

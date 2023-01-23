(load "exercises/ex-2-90.scm")

(define (install-rational-package)
  ;; internal procedures
  (define (make-rational dividend divisor)
    (tag (cons dividend divisor)))
  ;; TODO add, sub, ...
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

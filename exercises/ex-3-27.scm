(load "examples/table.scm")

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
	(or previously-computed-result
	    (let ((result (f x)))
	      (insert! x result table)
	      result))))))

(define memo-fib
  (memoize (lambda (n)
	     (cond ((= n 0) 0)
		   ((= n 1) 1)
		   (else (+ (memo-fib (- n 1))
			    (memo-fib (- n 2))))))))

;; Computing the nth Fibonacci number requires the computation of the
;; Fibonacci numbers n-1 and n-2, which happens
;; sequentially. Computing the Fibonacci number n-1 will also compute
;; the Fibonacci number n-2, therefore n computations will take place.

;; Defining `memo-fib` to be `(memoize fib)` would have a different
;; effect, because `fib` itself would circumvent the memoization
;; procedure.

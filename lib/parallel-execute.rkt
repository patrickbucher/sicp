(define (parallel-execute . procs)
  (map thread-wait
       (map (lambda (p) (thread p))
	    procs)))

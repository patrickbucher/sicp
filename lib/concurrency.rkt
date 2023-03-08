(require rnrs/mutable-pairs-6)
(require compatibility/mlist)

(define (parallel-execute . procs)
  (map thread-wait
       (map (lambda (p) (thread p))
	    procs)))

(define (make-serializer)
  (let ((mutex (make-mutex)))
    (lambda (p)
      (define (serialized-p . args)
	(mutex 'acquire)
	(let ((val (apply p args)))
	  (mutex 'release)
	  val))
      serialized-p)))

(define (make-mutex)
  (let ((cell (mlist false)))
    (define (the-mutex m)
      (cond ((eq? m' acquire)
	     (if (test-and-set! cell)
		 (the-mutex 'acquire)
		 (void)))
	    ((eq? m 'release)
	     (clear! cell))
	    ((eq? m 'free?)
	     (not (mcar cell)))))
    the-mutex))

(define (clear! cell)
  (set-mcar! cell false))

(define (test-and-set! cell)
  (if (mcar cell)
      true
      (begin (set-mcar! cell true)
	     false)))

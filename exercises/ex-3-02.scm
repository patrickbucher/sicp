(define (make-monitored f)
  (let ((counter 0))
    (define (mf msg)
      (cond ((eq? msg 'how-many-calls?) counter)
	    ((eq? msg 'reset-count) (begin (set! counter 0) counter))
	    ((integer? msg) (begin (set! counter (+ counter 1)) (f msg)))
	    (else (error "unknown message" msg))))
    mf))

(define s (make-monitored sqrt))

;; (s 100)
;; 10
;; (s 'how-many-calls?)
;; 1

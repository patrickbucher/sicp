(load "lib/concurrency.rkt")

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((protected (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) (protected withdraw))
	    ((eq? m 'deposit) (protected deposit))
	    ((eq? m 'balance)
	     ((protected (lambda () balance)))) ; serialzed
	    (else (error "unknown request -- make-account" m))))
    dispatch))

;; Even though the query for the balance wasn't serialized explicitly
;; before, there was no race condition in the code. Because all the
;; other accesses to balance have already been serialized, the balance
;; query was implicitly serialized, too.

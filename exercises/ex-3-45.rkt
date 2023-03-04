(load "lib/concurrency.rkt")

(define (make-account-and-serializer balance)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) (balance-serializer withdraw))
	    ((eq? m 'deposit) (balance-serializer deposit))
	    ((eq? m 'balance) balance)
	    ((eq? m 'serializer) balance-serializer)
	    (else (error "unknownrequest -- make-account" m))))
    dispatch))

(define foo (make-account-and-serializer 91))
(define bar (make-account-and-serializer 82))

(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
		       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

;; (exchange foo bar)
;; (foo 'balance)
;; 82
;; (bar 'balance)
;; 91

(define (serialized-exchange account1 account2)
  (let ((serializer1 (account1 'serializer))
	(serializer2 (account2 'serializer)))
    ((serializer1 (serializer2 exchange))
     account1
     account2)))

;; (serialized-exchange foo bar)
;; <deadlock>

;; The serialized-exchange procedure already acquires both mutexes for
;; account1 and account2. The already serialized procedures withdraw
;; and deposit then try to acquire the same mutex again, which creates
;; a deadlock. Only one mode of operation can be supported: internally
;; serialized procedures acquiring the mutex automatically, or having
;; the mutex exposed, to be acquired by the client code.

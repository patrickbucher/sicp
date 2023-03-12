(load "lib/concurrency.rkt")

(define (make-account-and-serializer number balance)
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
      (cond ((eq? m 'withdraw) withdraw)
	    ((eq? m 'deposit) deposit)
	    ((eq? m 'balance) balance)
	    ((eq? m 'number) number)
	    ((eq? m 'serializer) balance-serializer)
	    (else (error "unknownrequest -- make-account" m))))
    dispatch))

(define foo (make-account-and-serializer 100000 91))
(define bar (make-account-and-serializer 200000 82))

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
  (let ((first-acc (if (< (account1 'number) (account2 'number)) account1 account2))
	(second-acc (if (> (account1 'number) (account2 'number)) account1 account2)))
    (let ((serializer1 (first-acc 'serializer))
	  (serializer2 (second-acc 'serializer)))
      ((serializer1 (serializer2 exchange))
       first-acc
       second-acc))))

;; (serialized-exchange foo bar)
;; (foo 'balance)
;; 82
;; (bar 'balance)
;; 91

;; A deadlock results from two procedures (pA and pB) trying to lock
;; two ressources (r1 and r2) in a way that no procedure can ever
;; access both, e.g. pA locks r1, pB locks r2. Then pA fails to lock
;; r2, and pB fails to lock r1. With the ordered access implemented
;; using a number, both procedures will first try to acquire the lock
;; to r1, and the procedure earlier trying to do so "wins", after
;; which it can continue to do its work.

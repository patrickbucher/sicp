(load "examples/bank-account.rkt")
(load "lib/concurrency.rkt")

(define a (make-account 91))
(define b (make-account 82))
(define c (make-account 73))

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

(parallel-execute (lambda () (transfer a b 10))
		  (lambda () (transfer b c 20)))

(display "a=")
(display (a 'balance))
(display ", b=")
(display (b 'balance))
(display ", c=")
(display (c 'balance))
(newline)

;; The exchange procedures computes the difference in a first step,
;; which requires querying the two involved accounts balances. This
;; operation can be interrupted by a concurrent procedure that
;; exchanges account balances. The transfer procedure, however, only
;; relies on isolated transactions, and therefore is safe, given that
;; withdraw and deposit are serialized.

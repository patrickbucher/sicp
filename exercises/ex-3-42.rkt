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
    (let ((protected-withdraw (protected withdraw))
	  (protected-deposit (protected deposit)))
      (define (dispatch m)
	(cond ((eq? m 'withdraw) protected-withdraw)
	      ((eq? m 'deposit) protected-deposit)
	      ((eq? m 'balance) balance)
	      (else (error "unknown request -- make-account" m))))
      dispatch)))

(define account (make-account 100))
(parallel-execute (lambda () ((account 'withdraw) 10))
		  (lambda () ((account 'withdraw) 15))
		  (lambda () ((account 'deposit) 5))
		  (lambda () ((account 'deposit) 15)))
;; (account 'balance)
;; 95

;; The mutex is acquired within the procedure `serialized-p`, which is
;; only executed within the call to the `dispatch` procedure. The
;; mutex is shared, because the procedures use the same serializer
;; (exactly as before).

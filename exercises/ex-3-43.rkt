(load "examples/bank-account.rkt")
(load "lib/concurrency.rkt")

(define a (make-account 10))
(define b (make-account 20))
(define c (make-account 30))

(define (exchange account1 account2)
  (let ((difference (- (account1 'balance)
		       (account2 'balance))))
    ((account1 'withdraw) difference)
    ((account2 'deposit) difference)))

(parallel-execute (lambda () (exchange a b))
		  (lambda () (exchange b c)))

(display "a=")
(display (a 'balance))
(display ", b=")
(display (b 'balance))
(display ", c=")
(display (c 'balance))
(newline)

;; serialized
;; p1 (a <=> b):
;; difference = -10
;; a = 20
;; b = 10
;; p2 (b <=> c):
;; difference = -20
;; b = 30
;; c = 10
;; a = 20, b = 10, c = 30 (correct)

;; interleaved
;; p1 (a <=> b):
;; differnece = -10
;; a = 20
;; p2 (b <=> c):
;; difference = -10
;; b = 30
;; c = 20
;; p1 (a <=> b):
;; b = 20
;; a = 20, b = 30, c = 20 (wrong)

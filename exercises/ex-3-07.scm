(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin
	  (set! balance (- balance amount))
	  balance)
	'insufficient-funds))
  (define (deposit amount)
    (begin
      (set! balance (+ balance amount))
      balance))
  (lambda (pw msg)
    (if (eq? pw password)
	(cond ((eq? msg 'withdraw) withdraw)
	      ((eq? msg 'deposit) deposit)
	      (else (lambda (_) 'unknown-action)))
	(lambda (_) 'wrong-password))))

(define acc (make-account 100 'secret-password))

;; ((acc 'secret-password 'withdraw) 40)
;; 60
;; ((acc 'secret-password 'deposit) 50)
;; 110
;; ((acc 'secret-password 'withdraw) 200)
;; insufficient-funds
;; ((acc 'wrong-password 'deposit) 20)
;; wrong-password
;; ((acc 'wrong-password 'withdraw) 10)
;; wrong-password

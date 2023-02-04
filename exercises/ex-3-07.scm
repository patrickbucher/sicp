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

(define (make-joint account old-password new-password)
  (lambda (pw msg)
    (if (eq? pw new-password)
	(account old-password msg)
	(lambda (_) 'wrong-password-alias))))

(define peter-acc (make-account 100 'open-sesame))

;; ((peter-acc 'open-sesame 'withdraw) 10)
;; 90
;; ((peter-acc 'open-sesame 'deposit) 90)
;; 180

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

;; ((paul-acc 'rosebud 'withdraw) 20)
;; 160
;; ((paul-acc 'rosebud 'deposit) 30)
;; 190
;; ((paul-acc 'rosebud 'withdraw) 250)
;; insufficient-funds
;; ((paul-acc 'open-sesame 'withdraw) 50)
;; wrong-password-alias

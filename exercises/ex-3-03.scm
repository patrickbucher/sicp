(define (make-account balance initial-password)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	(error "insufficient funds")))
  (define (deposit amount)
    (begin (set! balance (+ balance amount))
	   balance))
  (define (dispatch password m)
    (if (not (eq? password initial-password))
	(error "incorrect password")
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else (error "unknown message" m)))))
  dispatch)

(define acc (make-account 100 'secret-password))

;; ((acc 'secret-password 'withdraw) 40)
;; 60
;; ((acc 'some-other-password 'deposit) 50)
;; incorrect password

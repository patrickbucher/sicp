(define (make-account balance initial-password)
  (let ((wrong-password-count 0)
	(bust-mode #f))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  (error "insufficient funds")))
    (define (deposit amount)
      (begin (set! balance (+ balance amount))
	     balance))
    (define (wrong-password _)
      (string "incorrect password " wrong-password-count "/7"))
    (define (call-the-cops _)
      (begin (set! balance 0)
	     (set! bust-mode #t)
	     'busted))
    (define (dispatch password m)
      (if bust-mode
	  call-the-cops
	  (if (not (eq? password initial-password))
	      (begin (set! wrong-password-count (+ wrong-password-count 1))
	             (if (> wrong-password-count 7)
			 call-the-cops
			 wrong-password))
	      (begin (set! wrong-password-count 0)
		     (cond ((eq? m 'withdraw) withdraw)
			   ((eq? m 'deposit) deposit)
			   (else (error "unknown message" m)))))))
    dispatch))

(define acc (make-account 100 'secret-password))

;; ((acc 'secret-password 'withdraw) 40)
;; 60
;; ((acc 'secret-password 'deposit) 50)
;; 110

;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 1/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 2/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 3/7"
;; ((acc 'secret-password 'withdraw) 5)
;; 105

;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 1/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 2/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 3/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 4/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 5/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 6/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; "incorrect password 7/7"
;; ((acc 'wrong-password 'withdraw) 5)
;; busted

;; ((acc 'secret-password 'withdraw) 5)
;; busted

(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "insufficient funds"))

;; (withdraw 25)
;; 75
;; (withdraw 25)
;; 50
;; (withdraw 60)
;; "insufficient funds"

(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "insufficient funds"))))

;; (new-withdraw 25)
;; 75
;; (new-withdraw 25)
;; 50
;; (new-withdraw 60)
;; "insufficient funds"

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"insufficient funds")))

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))

;; (W1 50)
;; 50
;; (W2 70)
;; 30
;; (W2 40)
;; "insufficient funds"
;; (W1 40)
;; 10

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "unknown request make-account" m))))
  dispatch)

(define acc (make-account 100))

;; ((acc 'withdraw) 50)
;; 50
;; ((acc 'withdraw) 60)
;; "insufficient funds"
;; ((acc 'deposit) 40)
;; 90
;; ((acc 'withdraw) 60)
;; 30
;; ((acc 'cleanup))
;; unknown request make-account cleanup


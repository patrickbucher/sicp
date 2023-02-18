(define (after-delay t f)
  (begin
    (sleep-current-thread t)
    (f)))

;; (after-delay 1000 (lambda () (display "hello")))
;; hello

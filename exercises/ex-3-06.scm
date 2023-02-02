(define a 2)
(define b 3)
(define m 100)
(define x 13)

(define (generate)
  (begin
    (set! x (remainder (+ (* a x) b) m))
    x))

(define (reset new-x)
  (begin
    (set! x new-x)
    x))
  
(define (rand message)
  (cond ((eq? message 'generate)
	 (generate))
	((eq? message 'reset)
	 (lambda (new-x) (reset new-x)))
	(else
	 (error "unknown message" message))))

;; (rand 'generate)
;; 29
;; (rand 'generate)
;; 61
;; (rand 'generate)
;; 25
;; ((rand 'reset) 13)
;; 13
;; (rand 'generate)
;; 29
;; (rand 'generate)
;; 61

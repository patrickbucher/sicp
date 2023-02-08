(define (mystery x)
  (define (loop x y)
    (if (null? x)
	y
	(let ((temp (cdr x)))
	  (set-cdr! x y)
	  (loop temp x))))
  (loop x '()))

(define v '(a b c d))
(define w (mystery v))

;; The mystery procedure reverses the given list.
;; (mystery '(a b c d))
;; (loop '(a b c d) '())
;; (loop '(b c d) '(a))
;; (loop '(c d) '(b a))
;; (loop '(d) '(c b a))
;; (loop '() '(d c b a))
;; '(d c b a)

;; However, the original list is destroyed in the process.
;; w
;; (d c b a)
;; v
;; (a)

(load "lib/streams.scm")

(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

;; (stream-ref x 5)

;; Upon the first execution, the values fro 1 to 5 are shown; then 5
;; is returned. For all further exections, only 5 is returned.

;; (stream-ref x 7)

;; Upon the first execution, and first execution of the procedure
;; above, 6 and 7 are shown, and 7 is returned.  For all further
;; executions, only 7 is returned.

;; The values are only displayed one by one upon realization of the
;; actual stream (stream-map show ... above).

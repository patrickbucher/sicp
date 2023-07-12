(load "lib/streams.scm")
;; (load "lib/streams-memo.scm")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
			 seq))

;; (stream-ref y 7)

;; (display-stream z)

;; seq:
;;  i   s
;;  1   1
;;  2   3
;;  3   6
;;  4  10
;;  5  15
;;  6  21
;;  7  28
;;  8  36
;;  9  45
;; 10  55
;; 11  66
;; 12  78
;; 13  91
;; 14 105
;; 15 120
;; 16 136
;; 17 153
;; 18 171
;; 19 190
;; 20 210

;; y
;; 6 10 28 36 66 78 120 136 190 210
;; (stream-ref y 7)
;; 136

;; z
;; 10 15 45 55 105 120 190 210

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((a (start-segment s))
	(b (end-segment s)))
    (let ((xs (x-point a))
	  (xe (x-point b))
	  (ys (y-point a))
	  (ye (y-point b)))
      (make-point
       (+ xs (/ (- xe xs) 2))
       (+ ys (/ (- ye ys) 2))))))

;; (print-point (midpoint-segment (make-segment (make-point 2 3) (make-point 8 7))))
;; (5,5)
;; (print-point (midpoint-segment (make-segment (make-point 1 3) (make-point 7 9))))
;; (4,6)

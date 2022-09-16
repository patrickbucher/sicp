(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
	       (lower-bound y)))
	(p2 (* (lower-bound x)
	       (upper-bound y)))
	(p3 (* (upper-bound x)
	       (lower-bound y)))
	(p4 (* (upper-bound x)
	       (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

;; two numbers
;; two endpoints per numbers, i.e. four endpoints
;;
;; 3 cases per factor:
;; - both positive
;; - lower negative, upper positive
;; - both negative
;;
;; combine with same 3 cases for other factor:
;; 1. a both positive; b both positive
;; 2. a both positive; b lower negative, b upper positive
;; 3. a both positive; b both negative
;; 4. a lower negative, upper positive; b both positive
;; 5. a lower negative, upper positive; b lower negative, upper positive
;; 6. a lower negative, upper positive; b both negative
;; 7. a both negative; b both positive
;; 8. a both negative; b lower negative, upper positive
;; 9. a both negative; b both negative
;;
;; TODO: reason on what bound to take for extreme values

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

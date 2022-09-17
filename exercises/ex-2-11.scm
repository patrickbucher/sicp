;; test routine to find min/max product by brute force
(define (min-max-prod x y)
  (let ((x-l (lower-bound x))
	(x-u (upper-bound x))
	(y-l (lower-bound y))
	(y-u (upper-bound y)))
    (make-interval
     (min (* x-l y-l)
	  (* x-l y-u)
	  (* x-u y-l)
	  (* x-u y-u))
     (max (* x-l y-l)
	  (* x-l y-u)
	  (* x-u y-l)
	  (* x-u y-u)))))

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

(define (mul-interval x y)
  (let ((x-l (lower-bound x))
	(x-u (upper-bound x))
	(y-l (lower-bound y))
	(y-u (upper-bound y)))
    (cond ((and (> x-l 0) (> x-u 0) (> y-l 0) (> y-u 0))
	   (make-interval (* x-l y-l) (* x-u y-u)))
	  ((and (> x-l 0) (> x-u 0) (< y-l 0) (> y-u 0))
	   (make-interval (* x-u y-l) (* x-u y-u)))
	  ((and (> x-l 0) (> x-u 0) (< y-l 0) (< y-u 0))
	   (make-interval (* x-u y-l) (* x-l y-u)))
	  (else #f))))

;; case 1:
;; (mul-interval (make-interval 0.9 1.1) (make-interval 1.8 2.2))
;; (1.62 . 2.4200000000000004)
;; (min-max-prod (make-interval 0.9 1.1) (make-interval 1.8 2.2))
;; (1.62 . 2.4200000000000004)
;; case 2:
;; (mul-interval (make-interval 0.9 1.1) (make-interval -0.5 0.5))
;; (-.55 . .55)
;; (min-max-prod (make-interval 0.9 1.1) (make-interval -0.5 0.5))
;; (-.55 . .55)
;; case 3:
;; (mul-interval (make-interval 1.9 2.1) (make-interval -1.5 -0.5))
;; (-3.1500000000000004 . -.95)
;; (min-max-prod (make-interval 1.9 2.1) (make-interval -1.5 -0.5))
;; (-3.1500000000000004 . -.95)

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

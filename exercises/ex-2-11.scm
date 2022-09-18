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
    (cond ((and (> x-l 0) (> x-u 0))
	   (cond ((and (> y-l 0) (> y-u 0))
	  	  (make-interval (* x-l y-l) (* x-u y-u)))
		 ((and (< y-l 0) (> y-u 0))
	  	  (make-interval (* x-u y-l) (* x-u y-u)))
		 ((and (< y-l 0) (< y-u 0))
		  (make-interval (* x-u y-l) (* x-l y-u)))))
	  ((and (< x-l 0) (> x-u 0))
	   (cond ((and (> y-l 0) (> y-u 0))
		  (make-interval (* x-l y-u) (* x-u y-u)))
		 ((and (< y-l 0) (> y-u 0))
		  (make-interval
		   (min (* x-l y-l) (* x-l y-u) (* x-u y-l) (* x-u y-u))
   		   (max (* x-l y-l) (* x-l y-u) (* x-u y-l) (* x-u y-u))))
		 ((and (< y-l 0) (< y-u 0))
		  (make-interval (* x-u y-l) (* x-l y-l)))))
	  ((and (< x-l 0) (< x-u 0))
	   (cond ((and (> y-l 0) (> y-u 0))
		  (make-interval (* x-l y-u) (* x-u y-l)))
		 ((and (< y-l 0) (> y-u 0))
		  (make-interval (* x-l y-u) (* x-l y-l)))
		 ((and (< y-l 0) (< y-u 0))
		  (make-interval (* x-u y-u) (* x-l y-l))))))))

;; Tests and validation against brute-force procedure min-max-prod.
;; case 1:
;; (mul-interval (make-interval 0.8 1.2) (make-interval 1.25 1.75))
;; (min-max-prod (make-interval 0.8 1.2) (make-interval 1.25 1.75))
;; (1. . 2.1)
;; case 2:
;; (mul-interval (make-interval 0.9 1.1) (make-interval -0.5 0.5))
;; (min-max-prod (make-interval 0.9 1.1) (make-interval -0.5 0.5))
;; (-.55 . .55)
;; case 3:
;; (mul-interval (make-interval 1.25 1.75) (make-interval -1.75 -1.25))
;; (min-max-prod (make-interval 1.25 1.75) (make-interval -1.75 -1.25))
;; (-3.0625 . -1.5625)
;; case 4:
;; (mul-interval (make-interval -0.5 0.5) (make-interval 0.9 1.1))
;; (min-max-prod (make-interval -0.5 0.5) (make-interval 0.9 1.1))
;; (-.55 . .55)
;; case 5:
;; (mul-interval (make-interval -0.1 0.9) (make-interval -0.3 0.3))
;; (min-max-prod (make-interval -0.1 0.9) (make-interval -0.3 0.3))
;; (-.27 . .27)
;; case 6:
;; (mul-interval (make-interval -0.5 0.5) (make-interval -0.8 -0.6))
;; (min-max-prod (make-interval -0.5 0.5) (make-interval -0.8 -0.6))
;; (-.4 . .4)
;; case 7:
;; (mul-interval (make-interval -0.8 -0.6) (make-interval 0.8 1.2))
;; (min-max-prod (make-interval -0.8 -0.6) (make-interval 0.8 1.2))
;; (-.96 . -.48)
;; case 8:
;; (mul-interval (make-interval -0.75 -0.25) (make-interval -0.5 0.5))
;; (min-max-prod (make-interval -0.75 -0.25) (make-interval -0.5 0.5))
;; (-.375 . .375)
;; case 9:
;; (mul-interval (make-interval -2.2 -1.8) (make-interval -1.4 -1.2))
;; (min-max-prod (make-interval -2.2 -1.8) (make-interval -1.4 -1.2))
;; (2.16 . 3.08)

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

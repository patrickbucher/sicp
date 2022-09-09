(define (gcd x y)
  (if (= y 0) x (gcd y (remainder x y))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g)
	  (/ d g))))

;; (print-rat (make-rat 5 15))
;; 1/3

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
	    (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;; (print-rat (add-rat one-half one-third))
;; 5/6
;; (print-rat (sub-rat one-half one-third))
;; 1/6
;; (print-rat (mul-rat one-half one-third))
;; 1/6
;; (print-rat (div-rat one-half one-third))
;; 3/2

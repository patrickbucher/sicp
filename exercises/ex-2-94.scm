(load "exercises/ex-2-90.scm") ;; mul-counted
(load "exercises/ex-2-91.scm") ;; subtract

(define (remainder-terms a b)
  (if (null? a)
      '()
      (let ((ta (car a))
	    (tb (car b)))
	(let ((oa (car ta))
	      (ob (car tb))
	      (ca (cadr ta))
	      (cb (cadr tb)))
	  (if (> ob oa)
	      a
	      (let ((nc (/ ca cb))
		    (no (- oa ob)))
		(let ((next-dividend (subtract a (mul-counted (list (list no nc)) b))))
		  (remainder-terms next-dividend b))))))))

(define a '((3 4) (2 1) (1 3) (0 2)))
(define b '((1 2) (0 3)))

;; (remainder-terms a b)
;; ((0 -55/4))

(define (gcd-terms a b)
  (if (null? b)
      a
      (gcd-terms b (remainder-terms a b))))

;; (gcd-terms a b)
;; ((0 -55/4))

(define (gcd-poly a b)
  (let ((va (car a))
	(vb (car b)))
    (if (not (eq? va vb))
	(error (string "different variables for a (" va ") and b (" vb ")."))
	(let ((ta (cdr a))
	      (tb (cdr b)))
	  (make-polynomial va (gcd-terms ta tb))))))

(define (make-polynomial var terms)
  (cons 'polynomial (cons var terms)))

(define (greatest-common-divisor a b)
  (gcd-poly (cdr a) (cdr b)))

(define p1 (make-polynomial 'x '((4 1) (3 -1) (2 -2) (1 2))))
(define p2 (make-polynomial 'x '((3 1) (1 -1))))
;; (greatest-common-divisor p1 p2)
;; (polynomial x (2 -1) (1 1))

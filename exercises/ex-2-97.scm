(load "lib/functools.scm") ;; reduce
(load "lib/math.scm") ;; pow
(load "exercises/ex-2-91.scm") ;; div-terms
(load "exercises/ex-2-94.scm") ;; gcd-terms
(load "exercises/ex-2-95.scm") ;; Q1, Q2

(define (reduce-poly P Q)
  (let ((vP (cadr P))
	(vQ (cadr Q)))
    (if (not (eq? vP vQ))
	(error (string "different variables " vP " and " vQ))
	(let ((tlP (cddr P))
	      (tlQ (cddr Q)))
	  (cons 'polynomial (cons vP (reduce-terms tlP tlQ)))))))

(define (reduce-terms n d)
  (let ((gcd-n-d (gcd-numer-denom n d)))
    (let ((mul-factor (gcd-integerizing-factor gcd-n-d n d)))
      (let ((nc (multiply n mul-factor))
	    (dc (multiply d mul-factor)))
	(let ((nn (car (div-terms nc gcd-n-d)))
	      (dd (car (div-terms dc gcd-n-d))))
	  (list nn dd))))))
	
(define (gcd-numer-denom num-tl den-tl)
  (let ((c (integerizing-factor num-tl den-tl)))
    (let ((num-tl-c (multiply num-tl c)))
      (simplify-coeffs (gcd-terms num-tl-c den-tl)))))

(define (simplify-coeffs tl)
  (let ((coeff-gcd (reduce (lambda (acc x) (gcd acc x))
			   (map (lambda (t) (cadr t)) tl)
			   (cadar tl))))
    (map (lambda (t) (list (car t) (/ (cadr t) coeff-gcd))) tl)))

(define (multiply tl c)
  (map (lambda (t) (list (car t) (* c (cadr t)))) tl))

(define (integerizing-factor P-tl Q-tl)
  (let ((lt-P (largest-term P-tl))
	(lt-Q (largest-term Q-tl)))
    (let ((o1 (order lt-P))
	  (o2 (order lt-Q))
	  (c (coeff lt-Q)))
      (pow c (+ 1 (- o1 o2))))))

(define (gcd-integerizing-factor GCD-tl P-tl Q-tl)
  (let ((lt-GCD (largest-term GCD-tl))
	(lt-P (largest-term P-tl))
	(lt-Q (largest-term Q-tl)))
    (let ((c (coeff lt-GCD))
	  (o1 (max (order lt-P) (order lt-Q)))
	  (o2 (order lt-GCD)))
      (pow c (+ 1 (- o1 o2))))))

(define (order t) (car t))
(define (coeff t) (cadr t))

(define (largest-term tl)
  (if (null? tl)
      (error "empty term list")
      (reduce (lambda (t acc) (if (> (car t) (car acc)) t acc)) (cdr tl) (car tl))))

(define (make-polynomial v tl)
  (cons 'polynomial (cons v tl)))

(define (make-rational numer denom)
  (cons 'rational (list numer denom)))

(define p1 (make-polynomial 'x '((1 1) (0 1))))
(define p2 (make-polynomial 'x '((3 1) (0 -1))))
(define p3 (make-polynomial 'x '((1 1))))
(define p4 (make-polynomial 'x '((2 1) (0 -1))))

(define rf1 (make-rational p1 p2))
(define rf2 (make-rational p3 p4))

;; (add rf1 rf2)
;; 

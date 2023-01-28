(load "lib/functools.scm") ;; reduce
(load "lib/math.scm") ;; pow
(load "examples/op-type-table.scm") ;; put, get, apply-generic
(load "exercises/ex-2-91.scm") ;; div-terms
(load "exercises/ex-2-94.scm") ;; gcd-terms
(load "exercises/ex-2-95.scm") ;; Q1, Q2

(define (reduce-generic-gcd a b)
  (apply-generic 'reduce-gcd a b))

(define (reduce-integers n d)
  (let ((g (gcd n d)))
    (list (/ n g) (/ d g))))

(define (reduce-poly P Q)
  (let ((vP (car P))
	(vQ (car Q)))
    (if (not (eq? vP vQ))
	(error (string "different variables " vP " and " vQ))
	(let ((tlP (cdr P))
	      (tlQ (cdr Q)))
	  (cons vP (reduce-terms tlP tlQ))))))

(define (install-reduce-gcd)
  (put 'reduce-gcd '(polynomial polynomial)
       (lambda (p q) (reduce-poly p q)))
  (put 'reduce-gcd '(scheme-number scheme-number)
       (lambda (x y) (reduce-integers x y)))
  'done)

;; (reduce-generic-gcd (cons 'scheme-number 18) (cons 'scheme-number 27))
;; (2 3)
;; (reduce-generic-gcd Q1 Q2)
;; (x ((2 11) (0 7)) ((1 13) (0 5)))

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

(install-reduce-gcd)

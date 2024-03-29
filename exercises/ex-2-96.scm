(load "lib/functools.scm") ;; reduce
(load "lib/math.scm") ;; pow
(load "exercises/ex-2-91.scm") ;; div-terms
(load "exercises/ex-2-95.scm") ;; Q1, Q2

(define (pseudoremainder-terms P Q)
  (let ((c (integerizing-factor P Q))
	(Pv (cadr P))
	(Qv (cadr Q)))
    (if (not (eq? Pv Qv))
	(error "different variables not supported")
	(let ((Pc (cons 'polynomial (cons Pv (multiply (term-list P) c)))))
	  (simplify-coeffs (greatest-common-divisor Pc Q))))))

(define (simplify-coeffs P)
  (let ((var (cadr P))
	(tl (cddr P)))
    (let ((coeff-gcd (reduce (lambda (acc x) (gcd acc x))
			     (map (lambda (t) (cadr t)) tl)
			     (cadar tl))))
      (let ((new-tl (map (lambda (t) (list (car t) (/ (cadr t) coeff-gcd))) tl)))
	(cons 'polynomial (cons var new-tl))))))

(define (multiply tl c)
  (map (lambda (t) (list (car t) (* c (cadr t)))) tl))

(define (integerizing-factor P Q)
  (let ((lt-p (largest-term P))
	(lt-q (largest-term Q)))
    (let ((o1 (order lt-p))
	  (o2 (order lt-q))
	  (c (coeff lt-q)))
      (pow c (+ 1 (- o1 o2))))))

(define (term-list p) (cddr p))

(define (largest-term p)
  (reduce (lambda (t acc) (if (> (car t) (car acc)) t acc)) (term-list p) '(0 0)))

(define (order t) (car t))
(define (coeff t) (cadr t))

;; (pseudoremainder-terms Q1 Q2)
;; (polynomial x (2 1) (1 -2) (0 1))

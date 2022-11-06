(define (parse expr)
  (cond ((and (list? expr)
	      (= (length expr) 3))
	 (let ((left (car expr))
	       (op (cadr expr))
	       (right (caddr expr)))
	   (cond ((eq? op '+) (make-sum left right))
		 ((eq? op '*) (make-product left right))
		 (else (error "unknown operand" op)))))
	(else expr)))

(define (sum? expr)
  (= (car expr) '+))

(define (make-sum left right)
  (list '+ left right))

(define (addend s)
  (cadr s))

(define (augend s)
  (caddr s))

(define (product? expr)
  (= (car expr) '*))

(define (make-product left right)
  (list '* left right))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(define example '(x + (3 * (x + (y + 2)))))

;; (parse example)
;; (+ x (3 * (x + (y + 2))))


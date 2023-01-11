(load "examples/op-type-table.scm")
(load "examples/coercion-table.scm")
(load "exercises/ex-2-89.scm") ;; coercions (ordered, counted)

(define (set-tag t l) (cons t l))
(define (get-tag l) (car l))
(define (get-val tl) (cdr tl))

(define (ensure tl type)
  (let ((tag (get-tag tl)))
    (if (eq? tag type)
	tl
	(let ((coercion (get-coercion tag type)))
	  (if (not coercion)
	      (error "no coercion " tag "->" type " found")
	      (coercion tl))))))

(define (prepend n e l)
  (if (<= n 0)
      l
      (prepend (- n 1) e (cons e l))))

(define (combine l1 l2 op)
  (define (next left right acc)
    (if (null? left)
	acc
	(next (cdr left)
	      (cdr right)
	      (append acc (list (op (car left) (car right)))))))
  (if (not (= (length l1) (length l2)))
      (error "l1 and l2 have different lengths")
      (next l1 l2 '())))

(define (install-ordered-termlist-package)
  ;; internal procedures
  (define (add-term-lists l1 l2)
    (cond ((and (=zero? l1) (=zero? l2)) '())
	  ((=zero? l1) l2)
	  ((=zero? l2) l1)
	  (else
	   (let ((n1 (length l1))
		 (n2 (length l2)))
	     (let ((m1 (- n2 n1))
		   (m2 (- n1 n2)))
	       (let ((l1 (prepend m1 0 l1))
		     (l2 (prepend m2 0 l2)))
		 (combine l1 l2 +)))))))
  (define (mul-term-lists l1 l2)
    (error "not implemented yet"))
  (define (=zero? l)
    (= (length (filter (lambda (x) (not (= x 0))) l)) 0))
  ;; coercion
  (define (ensure-ordered tl) (ensure tl 'ordered))
  ;; representation
  (define (tag l) (set-tag 'ordered l))
  (define (make-term-list l) l)
  ;; exposed procedures
  (put 'add '(ordered ordered)
       (lambda (l1 l2) (tag (add-term-lists l1 l2))))
  (put 'mul '(ordered ordered)
       (lambda (l1 l2) (tag (mul-term-lists l1 l2))))
  (put 'make 'ordered
       (lambda (l) (tag (make-term-list l))))
  (put '=zero? '(ordered)
       (lambda (l) (=zero? l)))
  'done)

(define (install-counted-termlist-package)
  ;; TODO: as above
  'done)

(define (install-termlist-coercions)
  (put-coercion 'ordered 'counted
		(lambda (tl)
		  (let ((l (get-val tl)))
		    (set-tag 'counted (ordered->counted l)))))
  (put-coercion 'counted 'ordered
		(lambda (tl)
		  (let ((l (get-val tl)))
		    (set-tag 'ordered (counted->ordered l)))))
  'done)

(install-ordered-termlist-package)
(install-counted-termlist-package)
(install-termlist-coercions)

(define o0 ((get 'make 'ordered) '(0 0 0)))
(define o1 ((get 'make 'ordered) '(3 5 1 2 4 3)))
(define o2 ((get 'make 'ordered) '(4 2 1 3 5)))
;; (apply-generic 'add o0 o0)
;; (ordered)
;; (apply-generic 'add o0 o1)
;; (ordered 3 5 1 2 4 3)
;; (apply-generic 'add o2 o0)
;; (ordered 4 2 1 3 5)
;; (apply-generic 'add o1 o2)
;; (ordered 3 9 3 3 7 8)
;; (apply-generic 'mul o1 o2)
;; TODO

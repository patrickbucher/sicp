(load "examples/op-type-table.scm")
(load "examples/coercion-table.scm")
(load "exercises/ex-2-89.scm") ;; coercions (ordered, counted)
(load "lib/functools.scm") ;; reduce, partition, prepend, combine

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

(define (mul-counted l1 l2)
  (define (mul-next left right acc)
    (if (null? left)
	acc
	(let ((lh (car left))
	      (lt (cdr left)))
	  (mul-next lt right (append acc (mul-each lh right '()))))))
  (define (mul-each term term-list acc)
    (map (lambda (ct)
	   (list (+ (car term) (car ct))
		 (* (cadr term) (cadr ct))))
	 term-list))
  (mul-next l1 l2 '()))

(define (simplify-addition counted-terms)
  (define (add-up terms)
    (if (null? terms)
	'()
	(let ((power (caar terms))
	      (coeffs (map cadr terms)))
	  (let ((total (reduce + coeffs 0)))
	    (list power total)))))
  (define (next terms acc)
    (if (null? terms)
	acc
	(let ((head (car terms))
	      (tail (cdr terms)))
	  (let ((partitioned
		 (partition (lambda (x) (= (car head) (car x))) terms)))
	    (let ((same-power (car partitioned))
		  (other-powers (cadr partitioned)))
	      (next other-powers (cons (add-up same-power) acc)))))))
  (sort (next counted-terms '())
	(lambda (a b) (> (car a) (car b)))))

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
    (cond ((=zero? l1) '())
	  ((=zero? l2) '())
	  (else
	   (let ((l1-counted (ordered->counted l1))
		 (l2-counted (ordered->counted l2)))
	     (counted->ordered
	      (simplify-addition
	       (mul-counted l1-counted l2-counted)))))))
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
  (put '=zero? 'ordered
       (lambda (l) (=zero? l)))
  'done)

(define (install-counted-termlist-package)
  ;; internal procedures
  (define (add-term-lists l1 l2)
    (cond ((and (=zero? l1) (=zero? l2)) '())
	  ((=zero? l1) l2)
	  ((=zero? l2) l1)
	  (else
	   (simplify-addition (append (cdr l1) (cdr l2))))))
  (define (mul-term-lists l1 l2)
    ;; TODO: use mul-counted
    (error "not implemented yet"))
  (define (=zero? l)
    (= (length (filter (lambda (x) (not (= (car x) 0))) (cdr l))) 0))
  ;; coercion
  (define (ensure-counted tl) (ensure tl 'counted))
  ;; representation
  (define (tag l) (set-tag 'counted l))
  (define (make-term-list l) l)
  ;; exposed procedures
  (put 'add '(counted counted)
       (lambda (l1 l2) (tag (add-term-lists l1 l2))))
  (put 'mul '(counted counted)
       (lambda (l1 l2) (tag (mul-term-lists l1 l2))))
  (put 'make 'counted
       (lambda (l) (tag (make-term-list l))))
  (put '=zero? 'counted
       (lambda (l) (=zero? l)))
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
;; (ordered 12 26 17 24 51 50 21 25 29 15)

(define oa ((get 'make 'ordered) '(2 1 3 5)))
(define ob ((get 'make 'ordered) '(4 2 5)))
;; (apply-generic 'add oa ob)
;; (ordered 2 5 5 10)
;; (apply-generic 'mul oa ob)
;; (ordered 8 8 24 31 25 25)

(define c0 ((get 'make 'counted) '((2 0) (1 0) (0 0))))
(define c1 ((get 'make 'counted) '((5 3) (4 3) (3 1) (2 2) (1 4) (0 3))))
(define c2 ((get 'make 'counted) '((4 4) (3 2) (2 1) (1 3) (0 5))))
;; (apply-generic 'add c0 c0)
;; (counted (1 0) (0 0)) TODO: ???
;; (apply-generic 'add c0 c1)
;; (counted (4 3) (3 1) (2 2) (1 4) (0 3)) TODO: ???

(define ca ((get 'make 'counted) '((3 2) (2 1) (1 3) (0 5))))
(define cb ((get 'make 'counted) '((2 4) (2 2) (0 5))))
;; TODO

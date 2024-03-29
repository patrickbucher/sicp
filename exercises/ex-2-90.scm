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
  (put '=zero? '(ordered)
       (lambda (l) (=zero? l)))
  'done)

(define (install-counted-termlist-package)
  ;; internal procedures
  (define (add-term-lists l1 l2)
    (cond ((and (=zero? l1) (=zero? l2)) '())
	  ((=zero? l1) l2)
	  ((=zero? l2) l1)
	  (else
	   (simplify-addition (append l1 l2)))))
  (define (mul-term-lists l1 l2)
    (cond ((=zero? l1) '())
	  ((=zero? l2) '())
	  (else
	   (simplify-addition (mul-counted l1 l2)))))
  (define (=zero? l)
    (= (length (filter (lambda (x) (not (= (cadr x) 0))) (cdr l))) 0))
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
  (put '=zero? '(counted)
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
;; (counted)
;; (apply-generic 'add c0 c1)
;; (counted (5 3) (4 3) (3 1) (2 2) (1 4) (0 3))
;; (apply-generic 'add c2 c0)
;; (counted (4 4) (3 2) (2 1) (1 3) (0 5))
;; (apply-generic 'add c1 c2)
;; (counted (5 3) (4 7) (3 3) (2 3) (1 7) (0 8))
;; (apply-generic 'mul c1 c2)
;; (counted (9 12) (8 18) (7 13) (6 22) (5 45) (4 40) (3 21) (2 25) (1 29) (0 15))

(define ca ((get 'make 'counted) '((3 2) (2 1) (1 3) (0 5))))
(define cb ((get 'make 'counted) '((2 4) (1 2) (0 5))))
;; (apply-generic 'add ca cb)
;; (counted (3 2) (2 5) (1 5) (0 10))
;; (apply-generic 'mul ca cb)
;; (counted (5 8) (4 8) (3 24) (2 31) (1 25) (0 25))

(define (install-polynomial-package)
  ;; internal procedures
  (define (=poly-zero? poly)
    (let ((terms (term-list poly)))
      (apply-generic '=zero? terms)))
  (define (combine-terms l1 l2 operation)
    (let ((t1 (car l1))
	  (t2 (car l2)))
      (if (eq? t1 t2)
	  (apply-generic operation l1 l2)
	  (let ((coerce-t1->t2 (get-coercion t1 t2))
		(coerce-t2->t1 (get-coercion t2 t1)))
	    (cond ((not (eq? coerce-t1->t2 #f))
		   (let ((left (coerce-t1->t2 l1))
			 (right l2))
		     (apply-generic operation left right)))
		  ((not (eq? coerce-t2->t1 #f))
		   (let ((left l1)
			 (right (coerce-t2->t1 l2)))
		     (apply-generic operation left right)))
		  (else
		   (error (string "no common coercion for " t1 " and " t2))))))))
  (define (add-terms l1 l2)
    (combine-terms l1 l2 'add))
  (define (mul-terms l1 l2)
    (combine-terms l1 l2 'mul))
  ;; representation
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  ;; operations
  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (add-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in same var -- ADD POLY"
	       (list p1 p2))))
  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in same var -- MUL-POLY"
	       (list p1 p2))))
  ;; procedures from earlier examples
  (define (attach-tag tag poly)
    (cons tag poly))
  (define (same-variable? v1 v2)
    (and (variable? v1)
	 (variable? v2)
	 (eq? v1 v2)))
  (define (variable? x) (symbol? x))
  ;; interface to the rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  (put '=zero? '(polynomial) =poly-zero?)
  'done)

(install-polynomial-package)

(define t0c ((get 'make 'polynomial) 'x c0))
(define t0o ((get 'make 'polynomial) 'x o0))
(define tac ((get 'make 'polynomial) 'x ca)) ;; counted term list
(define tbo ((get 'make 'polynomial) 'x ob)) ;; ordered term list

;; (apply-generic '=zero? t0c)
;; #t
;; (apply-generic '=zero? t0o)
;; #t
;; (apply-generic '=zero? tac)
;; #f
;; (apply-generic '=zero? tbo)
;; #f

;; (apply-generic 'add t0c t0o)
;; (polynomial x ordered)
;; (apply-generic 'add t0c tac)
;; (polynomial x counted (3 2) (2 1) (1 3) (0 5))
;; (apply-generic 'add t0o tbo)
;; (polynomial x ordered 4 2 5)
;; (apply-generic 'add tac tbo)
;; (polynomial x ordered 2 5 5 10)
;; (apply-generic 'add tbo tac)
;; (polynomial x counted (3 2) (2 5) (1 5) (0 10))

;; (apply-generic 'mul t0c t0o)
;; (polynomial x ordered)
;; (apply-generic 'mul t0c tac)
;; (polynomial x counted)
;; (apply-generic 'mul t0o tbo)
;; (polynomial x ordered)
;; (apply-generic 'mul tac tbo)
;; (polynomial x ordered 8 8 24 31 25 25)
;; (apply-generic 'mul tbo tac)
;; (polynomial x counted (5 8) (4 8) (3 24) (2 31) (1 25) (0 25))


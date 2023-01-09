(load "examples/op-type-table.scm")
(load "examples/coercion-table.scm")
(load "exercises/ex-2-89.scm")

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

(define (install-ordered-termlist-package)
  ;; internal procedures
  (define (add-term-lists l1 l2)
    (error "not implemented yet"))
  (define (mul-term-lists l1 l2)
    (error "not implemented yet"))
  (define (=zero? l)
    (error "not implemented yet"))
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

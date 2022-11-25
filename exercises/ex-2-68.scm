(define (encode message tree)
  (if (null? message)
      '()
      (append
       (encode-symbol (car message)
		      tree)
       (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-bit node bits)
    (if (null? node)
	#f
	(if (leaf? node)
	    (if (eq? (symbol-leaf node) symbol)
		bits
		#f)
	    (let ((lb (left-branch node))
		  (rb (right-branch node)))
	      (cond ((contains? lb symbol)
		     (encode-bit lb (append bits (list 0))))
		    ((contains? rb symbol)
		     (encode-bit rb (append bits (list 1))))
		    (else
		     #f))))))
  (encode-bit tree '()))

(define (contains? node symbol)
  (define (list-contains? xs x)
    (if (null? xs)
	#f
	(if (eq? (car xs) x)
	    #t
	    (list-contains? (cdr xs) x))))
  (list-contains? (symbols node) symbol))

;; from exercise ex-2-67.scm

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define  (make-code-tree left right)
  (list left
	right
	(append (symbols left)
		(symbols right))
	(+ (weight left) (weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define sample-tree
  (make-code-tree
   (make-leaf 'A 4)
   (make-code-tree
    (make-leaf 'B 2)
    (make-code-tree
     (make-leaf 'D 1)
     (make-leaf 'C 1)))))

(define cipher-message
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define plain-message
  '(a d a b b c a))

;; test
;; (encode plain-message sample-tree)
;; (0 1 1 0 0 1 0 1 0 1 1 1 0)


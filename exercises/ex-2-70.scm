;; from exercise 2.69 (mostly)

(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

(define (successive-merge nodes)
  (cond ((null? nodes) '())
	((= (length nodes) 1) (car nodes))
	(else
	 (let ((first (car nodes))
	       (second (cadr nodes))
	       (rest (cddr nodes)))
	   (let ((parent (make-node first second)))
	     (successive-merge (insert parent rest)))))))

(define (make-leaf-set pairs)
  (define (insert-next rest acc)
    (if (null? rest)
	acc
	(let ((pair (car rest)))
	  (let ((leaf (make-leaf (car pair) (cadr pair))))
	    (insert-next (cdr rest) (insert leaf acc))))))
  (insert-next pairs '()))

(define (insert node node-set)
  (define (try-pos node left right)
    (if (null? right)
	(append left (list node))
	(let ((leaf-weight (weight node))
	      (next-weight (weight (car right))))
	  (cond ((<= leaf-weight next-weight)
		 (append left (list node) right))
		((> leaf-weight next-weight)
		 (try-pos node (append left (list (car right))) (cdr right)))))))
  (try-pos node '() node-set))

(define (make-leaf symbols weight)
  (list 'leaf
	symbols
	weight))

(define  (make-node left right)
  (list 'node
	(append (symbols left)
		(symbols right))
	(+ (weight left) (weight right))
	left
	right))

(define (symbols node) (cadr node))

(define (weight node) (caddr node))

(define (leaf? node) (eq? (car node) 'leaf))

(define (encodes-symbol? node symbol)
  (eq? (car (symbols node)) symbol))

(define (left-branch node) (cadddr node))

(define (right-branch node) (car (cddddr node)))

;; from exercise 2.68

(define (encode message tree)
  (if (null? message)
      '()
      (append
       (encode-symbol (car message) tree)
       (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-bit node bits)
    (if (null? node)
	#f
	(if (leaf? node)
	    (if (encodes-symbol? node symbol)
		bits
		#f)
	    (let ((lb (left-branch node))
		  (rb (right-branch node)))
	      (cond ((contains? lb symbol)
		     (encode-bit lb (append bits (list 0))))
		    ((contains? rb symbol)
		     (encode-bit rb (append bits (list 1))))
		    (else (list 'fail-to-encode symbol)))))))
  (encode-bit tree '()))

(define (contains? node symbol)
  (define (list-contains? xs x)
    (if (null? xs)
	#f
	(if (eq? (car xs) x)
	    #t
	    (list-contains? (cdr xs) x))))
  (list-contains? (symbols node) symbol))

;; exercise 2.70

(define alphabet
  (list
   (list (list 'a) 2)
   (list (list 'boom) 1)
   (list (list 'get) 2)
   (list (list 'job) 2)
   (list (list 'na) 16)
   (list (list 'sha) 3)
   (list (list 'yip) 9)
   (list (list 'wah) 1)))

;; (generate-huffman-tree alphabet)
;; ((node (na yip wah boom job sha get a) 36
;;     (leaf (na) 16)
;;     (node (yip wah boom job sha get a) 20
;;         (leaf (yip) 9)
;;         (node (wah boom job sha get a) 11
;;             (node (wah boom job) 4
;;                 (node (wah boom) 2
;;                     (leaf (wah) 1)
;;                     (leaf (boom) 1))
;;                 (leaf (job) 2))
;;             (node (sha get a) 7
;;                 (leaf (sha) 3)
;;                 (node (get a) 4
;;                     (leaf (get) 2)
;;                     (leaf (a) 2)))))))

(define text
  (list
   'get 'a 'job
   'sha 'na 'na 'na 'na 'na 'na 'na 'na
   'get 'a 'job
   'sha 'na 'na 'na 'na 'na 'na 'na 'na
   'wah 'yip 'yip 'yip 'yip
   'yip 'yip 'yip 'yip 'yip
   'sha 'boom))

;; (encode text (generate-huffman-tree alphabet))
;; (1 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 0 0 0
;;  0 0 0 0 0 0 1 1 0 0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 0 1)

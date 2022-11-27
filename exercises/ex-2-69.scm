(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

(define (successive-merge nodes)
  (cond ((null? nodes) '())
	((= (length nodes) 1) nodes)
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

(define frequencies
  (list
   (list (list 'a) 7)
   (list (list 'b) 4)
   (list (list 'c) 3)
   (list (list 'd) 5)
   (list (list 'e) 9)
   (list (list 'f) 2)))

;; (generate-huffman-tree frequencies)
;; (node (d a b f c e) 30
;;     (node (d a) 12
;;         (leaf (d) 5)
;;         (leaf (a) 7))
;;     (node (b f c e) 18
;;         (node (b f c) 9
;;             (leaf (b) 4)
;;             (node (f c) 5
;;                 (leaf (f) 2)
;;                 (leaf (c) 3)))
;;         (leaf (e) 9))))


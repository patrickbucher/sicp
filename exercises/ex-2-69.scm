(define (generate-huffman-tree pairs)
  (successive-merge
   (make-leaf-set pairs)))

(define (make-leaf-set pairs)
  (define (insert rest left right)
    (if (null? rest)
	(append left right)
	(let ((new-leaf (make-leaf (caar rest) (cdar rest))))
	  (cond ((< (weight leaf) (weight (
    ;; TODO
    (cond ((null? rest)
	   (append left right))
	  ((null? right)
	   (append left right (list (make-leaf (caar rest) (cdar rest)))))
	  ((< (cdar rest) (weight leaf))
	   (insert (cdr rest)
		   (append left (cons (make-leaf (caar rest) (cdar rest))) right)
		   '()))
	  ((> (cdar rest) (weight leaf))
	   (insert rest (append left (list (car right))) (cdr right)))))
  (insert pairs '() '()))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (weight leaf) (caddr leaf))

(define  (make-code-tree left right)
  (list left
	right
	(append (symbols left)
		(symbols right))
	(+ (weight left) (weight right))))

(define frequencies
  (list
   '(a 7)
   '(b 2)
   '(c 3)
   '(d 4)
   '(e 13)
   '(f 2)))

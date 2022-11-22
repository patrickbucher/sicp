;; sample record data
(define dilbert (list 1324 "Dilbert" "Engineer"))
(define wally (list 4312 "Wally" "Engineer"))
(define alice (list 1432 "Alice" "Engineer"))
(define dogbert (list 542 "Dogbert" "Consultant"))
(define catbert (list 354 "Catbert" "HR Manager"))
(define boss (list 12 "Pointy-Haired Boss" "CxO"))

;; record structure
(define (employee-id employee)
  (car employee))

(define (employee-name employee)
  (cadr employee))

(define (employee-position employee)
  (caddr employee))

;; tree structure
(define (node-new value left-node right-node)
  (list value left-node right-node))

(define (node-value node)
  (car node))

(define (node-left node)
  (cadr node))

(define (node-right node)
  (caddr node))

(define (tree-insert tree new-record)
  (if (null? tree)
      (node-new new-record '() '())
      (let ((new-id (employee-id new-record))
	    (val-id (employee-id (node-value tree))))
	(cond ((< new-id val-id)
	       (node-new (node-value tree)
			 (tree-insert (node-left tree) new-record)
			 (node-right tree)))
	      ((> new-id val-id)
	       (node-new (node-value tree)
			 (node-left tree)
			 (tree-insert (node-right tree) new-record)))
	      (else '())))))

;; sample tree
(define t
  (tree-insert
   (tree-insert
    (tree-insert
     (tree-insert
      (tree-insert
       (tree-insert
	'()
	dilbert)
       wally)
      alice)
     dogbert)
    catbert)
   boss))

;; lookup in O(log n)
(define (lookup key tree)
  (if (null? tree)
      '()
      (let ((this-key (employee-id (node-value tree))))
	(if (= key this-key)
	    (node-value tree)
	    (if (< key this-key)
		(lookup key (node-left tree))
		(lookup key (node-right tree)))))))

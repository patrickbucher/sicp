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

;; TODO: insert record instead of node
;; TODO: perform the actual insert
(define (tree-insert tree new-node)
  (if (null? tree)
      new-node
      (let ((new-id (employee-id (node-value new-node)))
	    (val-id (employee-id (node-value tree))))
	(cond ((< new-id val-id) (tree-insert (node-left tree)))
	      ((> new-id val-id) (tree-insert (node-right tree)))
	      (else tree))))) ;; same id: could update...

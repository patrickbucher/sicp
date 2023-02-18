(define (make-node key value) (list key value '() '()))
(define (node-key node) (car node))
(define (node-value node) (cadr node))
(define (node-left node) (caddr node))
(define (node-right node) (cadddr node))
(define (node-set-left! node left) (set-car! (cddr node) left))
(define (node-set-right! node right) (set-car! (cdddr node) right))

(define (insert! tree key value)
  (if (null? tree)
      node
      (let ((old-key (node-key tree))
	    (new-node (make-node key value)))
	(if (< key old-key)
	    (if (null? (node-left tree))
		(node-set-left! tree new-node)
		(insert! (node-left tree) key value))
	    (if (null? (node-right tree))
		(node-set-right! tree new-node)
		(insert! (node-right tree) key value)))))
  'ok)

(define (lookup tree key)
  (if (equal? (node-key tree) key)
      (node-value tree)
      (if (< key (node-key tree))
	  (if (null? (node-left tree))
	      #f
	      (lookup (node-left tree) key))
	  (if (null? (node-right tree))
	      #f
	      (lookup (node-right tree) key)))))

(define drivers (make-node 14 'Alonso))
(insert! drivers 1 'Verstappen)
(insert! drivers 11 'Perez)
(insert! drivers 15 'Leclerc)
(insert! drivers 55 'Sainz)
(insert! drivers 63 'Russell)
(insert! drivers 44 'Hamilton)
(insert! drivers 31 'Ocon)
(insert! drivers 10 'Gasly)
(insert! drivers 4 'Norris)
(insert! drivers 77 'Bottas)
(insert! drivers 24 'Zhou)
(insert! drivers 18 'Stroll)
(insert! drivers 20 'Magnussen)
(insert! drivers 27 'Hulkenberg)
(insert! drivers 45 'DeVries)
(insert! drivers 22 'Tsunoda)
(insert! drivers 23 'Albon)


;; (lookup drivers 11)
;; perez
;; (lookup drivers 27)
;; hulkenberg
;; (lookup drivers 6)
;; #f

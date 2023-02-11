(define (cycle? items)
  (define (next lead-cell lead-index check-cell check-index)
    (cond ((null? items) #f)
	  ((< check-index lead-index)
	   ;; check mode
	   (if (eq? check-cell lead-cell)
	       #t
	       (if (null? check-cell)
		   #f
		   (next lead-cell lead-index (cdr check-cell) (+ check-index 1)))))
	  (else
	   ;; advance mode
	   (if (null? lead-cell)
	       #f
	       (next (cdr lead-cell) (+ lead-index 1) items 0)))))
  (next items 0 items 0))


(define straight '(a b c d e))
;; (cycle? straight)
;; #f

(define cyclic '(a b c d e))
(set-cdr! (cddddr cyclic) cyclic)
;; (cycle? cyclic)
;; #t

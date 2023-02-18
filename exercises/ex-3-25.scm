(load "examples/table2d.scm")

(define population (make-table))
(insert! 'switzerland 'lucerne 81592 population)
(insert! 'switzerland 'zurich 402762 population)
(insert! 'germany 'berlin 3645000 population)
(insert! 'germany 'muenchen 1472000 population)

(define (lookup-nd keys table)
  (if (null? keys)
      (if table
	  (cdr table)
	  #f)
      (let ((subtable (assoc (car keys) (cdr table))))
	(if subtable
	    (lookup-nd (cdr keys) subtable)
	    #f))))

;; (lookup 'germany 'muenchen population)
;; 1472000
;; (lookup-nd '(germany muenchen) population)
;; 1472000

(define (insert-nd! keys value table)
  (if (null? keys)
      (if table
	  (set-cdr! table value)
	  #f)
      (let ((subtable (assoc (car keys) (cdr table))))
	(if subtable
	    (insert-nd! (cdr keys) value subtable)
	    (let ((new-subtable (cons (car keys) '())))
	      (set-cdr! table
			(cons new-subtable
			      (cdr table)))
	      (insert-nd! (cdr keys) value new-subtable)))))
  'ok)

;; overwrite existing:
;; (insert-nd! '(switzerland lucerne) 90000 population)
;; ok
;; (lookup-nd '(switzerland lucerne) population)
;; 90000

;; insert new entry:
;; (insert-nd! '(switzerland basel) 171017 population)
;; ok
;; (lookup-nd '(switzerland basel) population)
;; 171017

;; insert new table:
;; (insert-nd! '(france paris) 2161000 population)
;; ok
;; (lookup-nd '(france paris) population)
;; 2161000

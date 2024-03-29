(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;; Mobile: length in characters; weight of o=2, O=4.
;;
;; O---x---O     o---x--O
;;     |             |
;;     |             |
;;     |             |
;;     x------X------x
;;     |             |
;;     |             |
;;     |             |
;; O---x---o    o----x-O
;;
;; End pieces named from top left (clockwise): a, b, c, d.
;; Left and right are relative to the connection point x.

(define endpiece-a (make-mobile (make-branch 3 4)
				(make-branch 3 4)))

(define endpiece-b (make-mobile (make-branch 3 2)
				(make-branch 2 4)))

(define endpiece-c (make-mobile (make-branch 1 4)
				(make-branch 4 2)))

(define endpiece-d (make-mobile (make-branch 3 2)
				(make-branch 3 4)))

(define midpiece-l (make-mobile (make-branch 3 endpiece-d)
				(make-branch 3 endpiece-a)))

(define midpiece-r (make-mobile (make-branch 3 endpiece-b)
				(make-branch 3 endpiece-c)))

(define m (make-mobile (make-branch 6 midpiece-l)
		       (make-branch 6 midpiece-r)))

;; new structure: new access
(define (left-branch m) (car m))
(define (right-branch m) (cdr m))
(define (branch-length b) (car b))
(define (branch-structure b) (cdr b))

(define (total-weight m)
  (if (number? m)
      m
      (let ((l (left-branch m))
	    (r (right-branch m)))
	(+ (total-weight (branch-structure l))
	   (total-weight (branch-structure r))))))
      
;; (total-weight m)
;; 26

(define (balanced? m)
  (if (number? m)
      #t ; a weight is balanced
      (let ((l (left-branch m))
	    (r (right-branch m)))
	(let ((len-l (branch-length l))
	      (len-r (branch-length r)))
	  (let ((torque-l (* len-l (total-weight (branch-structure l))))
		(torque-r (* len-r (total-weight (branch-structure r)))))
	    (and (= torque-l torque-r)
		 (balanced? (branch-structure l))
		 (balanced? (branch-structure r))))))))

;; (balanced? m)
;; #f

(define endpiece (make-mobile (make-branch 2 3)
			      (make-branch 2 3)))
(define midpiece (make-mobile (make-branch 3 endpiece)
			      (make-branch 3 endpiece)))
(define mb (make-mobile (make-branch 5 midpiece)
			(make-branch 5 midpiece)))

;; (balanced? mb)
;; #t

;; Very little needed to be changed:
;; - The four access procedures
;; - The way each mobile was checked whether or not it was a weight
;; The latter step could habe been left out if such a procedure was defined earlier on.

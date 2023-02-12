(load "examples/queue.scm")

(define (print-queue queue)
  (if (empty-queue? queue)
      (newline)
      (let ((front (front-ptr queue))
	    (rear (rear-ptr queue)))
	(display (string (car front) " "))
	(print-queue (cons (cdr front) rear)))))

(define q (make-queue))
(insert-queue! q 1)
(insert-queue! q 2)
(insert-queue! q 3)
(insert-queue! q 4)
(insert-queue! q 5)
(delete-queue! q)
;; (print-queue q)
;; 2 3 4 5

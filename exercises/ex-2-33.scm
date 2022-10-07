(define (accumulate combine initial sequence)
  (if (null? sequence)
      initial
      (accumulate combine (combine initial (car sequence)) (cdr sequence))))

;; (accumulate (lambda (x y) (+ x y)) 0 (list 1 2 3 4 5))
;; 15

(define nil '())

(define (map p sequence)
  (accumulate (lambda (x y) (list (p x)))
	      nil sequence))

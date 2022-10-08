(define (accumulate combine initial sequence)
  (if (null? sequence)
      initial
      (combine (car sequence)
	       (accumulate combine initial (cdr sequence)))))

;; (accumulate (lambda (x y) (+ x y)) 0 (list 1 2 3 4 5))
;; 15

(define nil '())

(define (twice x) (* x 2))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
	      nil sequence))

;; (map twice (list 1 2 3))
;; (2 4 6)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;; (append (list 1 2 3) (list 4 5 6))
;; (1 2 3 4 5 6)

(define (length sequence)
  (accumulate (lambda (elem acc) (+ acc 1))
	      0 sequence))

;; (length (list 1 2 3 4 5))
;; 5

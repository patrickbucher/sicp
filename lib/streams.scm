(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (take s n)
  (define (next s n acc)
    (if (= n 0)
	acc
	(next (stream-cdr s)
	      (- n 1)
	      (cons (stream-car s) acc))))
  (reverse (next s n '())))

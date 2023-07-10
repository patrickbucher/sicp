(load "lib/streams.scm")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
	      (cons proc (map stream-cdr argstreams))))))

;; (display-stream (stream-map (lambda (x) (+ x 1)) (stream-enumerate-interval 0 2)))
;; 1
;; 2
;; 3

;; (display-stream (stream-map (lambda (x y) (+ x y))
;;                             (stream-enumerate-interval 0 2)
;;                             (stream-enumerate-interval 10 12)))
;; 10
;; 12
;; 14

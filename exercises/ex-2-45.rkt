#lang sicp
(#%require sicp-pict)

(define rogers (load-painter "william-barton-rogers.jpg"))

(define (split tl tr)
  (define (transform painter n)
    (if (= n 0)
        painter
        (let ((smaller (transform painter (- n 1))))
          (tl painter
              (tr smaller smaller)))))
  transform)

(define right-split (split beside below))

(define up-split (split below beside))

(paint (right-split rogers 3))

(paint (up-split rogers 3))

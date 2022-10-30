#lang sicp

(#%require sicp-pict)

(define rogers (load-painter "william-barton-rogers.jpg"))

(define (besides left right)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left (transform-painter left
                                         (make-vect 0.0 0.0)
                                         split-point
                                         (make-vect 0.0 1.0)))
          (paint-right (transform-painter right
                                          split-point
                                          (make-vect 1.0 0.0)
                                          (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))


(define (below1 upper lower)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-upper (transform-painter upper
                                          split-point
                                          (make-vect 1.0 0.5)
                                          (make-vect 0.0 1.0)))
          (paint-lower (transform-painter upper
                                          (make-vect 0.0 0.0)
                                          (make-vect 1.0 0.0)
                                          split-point)))
      (lambda (frame)
        (paint-upper frame)
        (paint-lower frame)))))

(define (rotate-clockwise-90 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate-counterclockwise-90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define (below2 upper lower)
  (let ((ru (rotate-clockwise-90 upper))
        (rl (rotate-clockwise-90 lower)))
    (let ((combined (besides rl ru)))
      (let ((rotated (rotate-counterclockwise-90 combined)))
        (lambda (frame)
          (rotated frame))))))

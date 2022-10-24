#lang sicp
(#%require sicp-pict)

(define wave (load-painter "wave-man.jpg"))
(define rogers (load-painter "william-barton-rogers.jpg"))

(define (paint-res p w h)
  (paint p #:width w #:height h))

(define (paint-big p)
  (paint p #:width 800 #:height 800))

(paint wave)
(paint rogers)

(paint (beside wave rogers))
(paint (below wave rogers))

(define wave2 (beside wave (flip-vert wave)))
(define wave4 (below wave2 wave2))
(paint wave2)
(paint wave4)

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define wave4b (flipped-pairs wave))
(paint wave4b)

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter
                (below smaller smaller)))))

(paint-big (right-split rogers 4))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter
               (beside smaller smaller)))))

(paint-big (corner-split rogers 3))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter)
                        quarter)))
      (below (flip-vert half) half))))

(paint-big (square-limit rogers 3))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter)
                       (tr painter)))
          (bottom (beside (bl painter)
                          (br  painter))))
      (below bottom top))))

(define (new-flipped-pairs painter)
  (let ((combine4
         (square-of-four identity flip-vert identity flip-vert)))
    (combine4 painter)))

(paint-big (new-flipped-pairs rogers))

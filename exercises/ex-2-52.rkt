#lang sicp

(#%require sicp-pict)

(define (paint-big p)
  (paint p #:width 600 #:height 600))

(define rogers (load-painter "william-barton-rogers.jpg"))

(define wave
  (segments->painter
   (list (make-segment (make-vect 0.25 0.0)
                       (make-vect 0.35 0.45))
         (make-segment (make-vect 0.35 0.45)
                       (make-vect 0.3 0.55))
         (make-segment (make-vect 0.3 0.55)
                       (make-vect 0.2 0.45))
         (make-segment (make-vect 0.2 0.45)
                       (make-vect 0.0 0.55))
         (make-segment (make-vect 0.0 0.6)
                       (make-vect 0.2 0.5))
         (make-segment (make-vect 0.2 0.5)
                       (make-vect 0.3 0.6))
         (make-segment (make-vect 0.3 0.6)
                       (make-vect 0.4 0.6))
         (make-segment (make-vect 0.4 0.6)
                       (make-vect 0.3 0.8))
         (make-segment (make-vect 0.3 0.8)
                       (make-vect 0.4 1.0))
         ;; 1) add a smile
         (make-segment (make-vect 0.45 0.7)
                       (make-vect 0.5 0.65))
         (make-segment (make-vect 0.5 0.65)
                       (make-vect 0.55 0.7))
         ;; ---
         (make-segment (make-vect 0.6 1.0)
                       (make-vect 0.7 0.8))
         (make-segment (make-vect 0.7 0.8)
                       (make-vect 0.6 0.6))
         (make-segment (make-vect 0.6 0.6)
                       (make-vect 0.7 0.6))
         (make-segment (make-vect 0.7 0.6)
                       (make-vect 1.0 0.35))
         (make-segment (make-vect 1.0 0.25)
                       (make-vect 0.65 0.55))
         (make-segment (make-vect 0.65 0.55)
                       (make-vect 0.7 0.0))
         (make-segment (make-vect 0.6 0.0)
                       (make-vect 0.5 0.3))
         (make-segment (make-vect 0.5 0.3)
                       (make-vect 0.4 0.0)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter
               (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))                                                      
        (beside painter                                                                                   
                (below smaller smaller))))) 

(define (corner-split painter n)                                                                          
  (if (= n 0)                                                                                             
      painter                                                                                             
      (let ((up (up-split painter (- n 1)))                                                               
            (right (right-split painter (- n 1))))                                                        
        (let ((top-left (beside up (flip-horiz up)))
              (bottom-right (below right (flip-vert right)))
              (corner (corner-split painter (- n 1))))                                                    
          (beside (below painter top-left)                                                                
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter)
                       (tr painter)))
          (bottom (beside (bl painter)
                          (br  painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4
         (square-of-four flip-vert
                         rotate180
                         identity
                         flip-horiz)))
    (combine4 (corner-split painter n))))

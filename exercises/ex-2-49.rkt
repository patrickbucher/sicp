#lang sicp

(#%require sicp-pict)
(#%require graphics/graphics)

(define outline
  (segments->painter
   (list (make-segment (make-vect 0 0)
                       (make-vect 0 1))
         (make-segment (make-vect 0 1)
                       (make-vect 1 1))
         (make-segment (make-vect 1 1)
                       (make-vect 1 0))
         (make-segment (make-vect 1 0)
                       (make-vect 0 0)))))

(define x
  (segments->painter
   (list (make-segment (make-vect 0 0)
                       (make-vect 1 1))
         (make-segment (make-vect 0 1)
                       (make-vect 1 0)))))

(define diamond
  (segments->painter
   (list (make-segment (make-vect 0 0.5)
                       (make-vect 0.5 1))
         (make-segment (make-vect 0.5 1)
                       (make-vect 1 0.5))
         (make-segment (make-vect 1 0.5)
                       (make-vect 0.5 0))
         (make-segment (make-vect 0.5 0)
                       (make-vect 0 0.5)))))

(define wave
  (segments->painter
   (list (make-segment (make-vect 0.25 0.0)
                       (make-vect 0.35 0.45)) ;; 1
         (make-segment (make-vect 0.35 0.45)
                       (make-vect 0.3 0.55)) ;; 2
         (make-segment (make-vect 0.3 0.55)
                       (make-vect 0.2 0.45)) ;; 3
         (make-segment (make-vect 0.2 0.45)
                       (make-vect 0.0 0.55)) ;; 4
         (make-segment (make-vect 0.0 0.6)
                       (make-vect 0.2 0.5)) ;; 5
         (make-segment (make-vect 0.2 0.5)
                       (make-vect 0.3 0.6)) ;; 6
         (make-segment (make-vect 0.3 0.6)
                       (make-vect 0.4 0.6)) ;; 7
         (make-segment (make-vect 0.4 0.6)
                       (make-vect 0.3 0.8)) ;; 8
         (make-segment (make-vect 0.3 0.8)
                       (make-vect 0.4 1.0)) ;; 9
         (make-segment (make-vect 0.6 1.0)
                       (make-vect 0.7 0.8)) ;; 10
         (make-segment (make-vect 0.7 0.8)
                       (make-vect 0.6 0.6)) ;; 11
         (make-segment (make-vect 0.6 0.6)
                       (make-vect 0.7 0.6)) ;; 12
         (make-segment (make-vect 0.7 0.6)
                       (make-vect 1.0 0.35)) ;; 13
         (make-segment (make-vect 1.0 0.25)
                       (make-vect 0.65 0.55)) ;; 14
         (make-segment (make-vect 0.65 0.55)
                       (make-vect 0.7 0.0)) ;; 15
         (make-segment (make-vect 0.6 0.0)
                       (make-vect 0.5 0.3)) ;; 16
         (make-segment (make-vect 0.5 0.3)
                       (make-vect 0.4 0.0))))) ;; 17

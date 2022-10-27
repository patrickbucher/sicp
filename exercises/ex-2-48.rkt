#lang sicp

(define (make-vect x y)
  (list x y))

(define a (make-vect 2 3))
(define b (make-vect 3 5))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cadr v))

(define (make-segment v1 v2)
  (list v1 v2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cadr s))

(define s1 (make-segment a b))

;; (start-segment s1)
;; (2 3)
;; (end-segment s1)
;; (3 5)
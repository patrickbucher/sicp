#lang sicp

(define (make-vect x y)
  (list x y))

(define o (make-vect 0 0))
(define e1 (make-vect 2 3))
(define e2 (make-vect 3 5))

;; first implementation
(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

(define f1 (make-frame-list o e1 e2))

(define (list-frame-origin frame)
  (car frame))

(define (list-frame-edge1 frame)
  (cadr frame))

(define (list-frame-edge2 frame)
  (caddr frame))

;; (list-frame-origin f1)
;; (0 0)
;; (list-frame-edge f1)
;; (2 3)
;; (list-frame-edge f2)
;; (3 5)

;; second implementation
(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define f2 (make-frame-cons o e1 e2))

(define (cons-frame-origin frame)
  (car frame))

(define (cons-frame-edge1 frame)
  (cadr frame))

(define (cons-frame-edge2 frame)
  (cddr frame))

;; (cons-frame-origin f2)
;; (0 0)
;; (cons-frame-edge1 f2)
;; (2 3)
;; (cons-frame-edge2 f2)
;; (3 5)

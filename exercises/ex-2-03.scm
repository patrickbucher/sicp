;; point-based implementation of a rectangle
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-rect a b)
  (cons a b))

(define (a-point r)
  (car r))

(define (b-point r)
  (cdr r))

(define (width r)
  (let ((a (a-point r))
	(b (b-point r)))
    (let ((xa (x-point a))
	  (xb (x-point b)))
      (abs (- xb xa)))))

(define (height r)
  (let ((a (a-point r))
	(b (b-point r)))
    (let ((ya (y-point a))
	  (yb (y-point b)))
      (abs (- yb ya)))))

;; implementation independent procedures
(define (perimeter r)
  (+ (* 2 (width r))
     (* 2 (height r))))

(define (area r)
  (* (width r) (height r)))

;; (perimeter (make-rect (make-point 2 1) (make-point 6 4)))
;; 14
;; (area (make-rect (make-point 2 1) (make-point 6 4)))
;; 12

;; width/height-based implementation of a rectangle
(define (make-rect w h)
  (cons w h))

(define (width r)
  (car r))

(define (height r)
  (cdr r))

;; (perimeter (make-rect 4 3))
;; 14
;; (area (make-rect 4 3))
;; 12

(load "examples/op-type-table.scm")


;; Rectangular Implementation

(define (install-rectangular-package)
  ;; internal proceducres
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y)
    (cons x y))
  (define (magnitude z)
    (sqrt (+ (square (real-part z))
	     (square (imag-part z)))))
  (define (angle z)
    (atan (imag-part z) (real-part z)))
  (define (make-from-mag-ang r a)
    (cons (* r (cos a)) (* r (sin a))))
  ;; interface to the rest of the system
  (define (tag x)
    (attach-tag 'rectangular x))
  (put 'real-part 'rectangular real-part)
  (put 'imag-part 'rectangular imag-part)
  (put 'magnitude 'rectangular magnitude)
  (put 'angle 'rectangular angle)
  (put 'make-from-real-imag 'rectangular
       (lambda (x y)
	 (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
       (lambda (r a)
	 (tag (make-from-mag-ang r a))))
  'done)


;; Polar Implementation

(define (install-polar-package)
  ;; internal procedures
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (make-from-mag-ang r a)
    (cons r a))
  (define (real-part z)
    (* (magnitude z) (cos (angle z))))
  (define (imag-part z)
    (* (magnitude z) (sin (angle z))))
  (define (make-from-real-imag x y)
    (cons (sqrt (+ (square x) (square y)))
	  (atan y x)))
  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'polar x))
  (put 'real-part 'polar real-part)
  (put 'imag-part 'polar imag-part)
  (put 'magnitude 'polar magnitude)
  (put 'angle 'polar angle)
  (put 'make-from-real-imag 'polar
       (lambda (x y)
	 (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar
       (lambda (r a)
	 (tag (make-from-mag-ang r a))))
  'done)


;; generic procedures

(define (apply-generic op arg)
  (let ((tag (type-tag arg)))
    (let ((proc (get op tag)))
      (if proc
	  (proc (contents arg))
	  (error
	   "No method for these types: APPLY-GENERIC"
	   (list op tag))))))

(define (real-part z)
  (apply-generic 'real-part z))
(define (imag-part z)
  (apply-generic 'imag-part z))
(define (magnitude z)
  (apply-generic 'magnitude z))
(define (angle z)
  (apply-generic 'angle z))

(define (make-from-real-imag x y)
  ((get 'make-from-real-imag
	'rectangular)
   x y))

(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang
	'polar)
   r a))

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum: CONTENTS" datum)))


;; example usage

(install-rectangular-package)
(install-polar-package)

(define z1 (make-from-real-imag 3 4))
(define z2 (make-from-mag-ang 5 50))

;; (real-part z1)
;; 3
;; (real-part z2)
;; 4.824830142460566
;; (imag-part z1)
;; 4
;; (imag-part z2)
;; -1.3118742685196438
;; (magnitude z1)
;; 5
;; (magnitude z2)
;; 5
;; (angle z1)
;; .9272952180016122
;; (angle z2)
;; 50

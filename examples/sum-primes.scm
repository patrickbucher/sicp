(load "lib/prime.scm")

(define (sum-primes-imperative a b)
  (define (iter count accum)
    (cond ((> count b) accum)
	  ((prime? count) (iter (+ count 1) (+ count accum)))
	  (else (iter (+ count 1) accum))))
  (iter a 0))

;; (sum-primes-imperative 1 10)
;; 17

(define (accumulate op init seq)
  (define (next acc elems)
    (if (null? elems)
	acc
	(next (op acc (car elems)) (cdr elems))))
  (next init seq))

(define (enumerate-interval a b)
  (enumerate a b))

(define (sum-primes-functional a b)
  (accumulate +
	      0
	      (filter prime? (enumerate-interval a b))))

;; (sum-primes-functional 1 10)
;; 17

(define (timed func args)
  (let ((start (runtime)))
    (apply func args)
    (let ((end (runtime)))
      (- end start))))

;; (timed sum-primes-imperative '(1 10000))
;; 3.460000000000008
;; (timed sum-primes-functional '(1 10000))
;; 3.1000000000000085
;; The functional code is not only more elegant, but also slightly faster.

(define (second-prime-imperative a b)
  (define (next i acc)
    (if (> i b)
	#f
	(if (prime? i)
	    (if (= acc 1)
		i
		(next (+ i 1) (+ acc 1)))
	    (next (+ i 1) acc))))
  (next a 0))

;; (second-prime-imperative 100 200)
;; 103

(define (second-prime-functional a b)
  (cadr (filter prime? (enumerate-interval a b))))

;; (second-prime-functional 100 200)
;; 103

;; (timed second-prime-imperative '(10000 20000))
;; 1.0000000000005116e-2
;; (timed second-prime-functional '(10000 20000))
;; 7.719999999999999
;; The functional code is more elegant, but also significanlty slower.

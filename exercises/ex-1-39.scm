(define (tan-cf x k)
  (define (numerator i)
    (if (= i 1)
	x
	(* x x)))
  (define (denominator i)
    (+ 1 (* 2 (- i 1))))
  (define (next-frac i)
    (if (> i k)
	0.
	(/ (numerator i)
	   (- (denominator i) (next-frac (+ i 1))))))
  (next-frac 1))

(define pi 3.14159265359)

(define (deg-to-rad d)
  (* d (/ pi 180)))

(define (rad-to-deg r)
  (* r (/ 180 pi)))

;; (tan-cf (/ pi 4) 1)
;; .7853981633975
;; (tan-cf (/ pi 4) 2)
;; .9886892399343039
;; (tan-cf (/ pi 4) 4)
;; .9999978684157983
;; (tan-cf (/ pi 4) 8)
;; 1.0000000000001028

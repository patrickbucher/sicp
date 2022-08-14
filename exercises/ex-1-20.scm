(define (gcd a b)
  (if (= b 0) a (gcd b (remainder a b))))

;; 1. normal-order evaluation: (gcd 206 40)
;;
;; a=206, b=40
;; (if (= 40 0) 206 (gcd 40 (r 206 40)))
;;
;; a=40, b=(r 206 40)
;; (if (= (r 206 40) 0) 40 (gcd (r 206 40) (r 40 (r 206 40))))
;;
;; a=(r 206 40), b=(r 40 (r 206 40))
;; (if (= (r 40 (r 206 40)) 0) (r 206 40) (gcd (r 40 (r 206 40))
;;                                             (r (r 206 40) (r 40 (r 206 40)))))
;;
;; a=(r 40 (r 206 40)), b=(r (r 206 40) (r 40 (r 206 40)))
;; (if (= (r (r 206 40) (r 40 (r 206 40))) 0)
;;  (r 40 (r 206  40))
;;  (gcd (r (r 206 40) (r 40 (r 206 40)))
;;       (r (r 40 (r 206  40))
;;          (r (r 206 40) (r 40 (r 206 40))))))
;;
;; remainder is evaluated 17 times


;; 2. applicative-order evaluation: (gcd 206 40)
;;
;; (gcd 206 40) ; 1x
;; (gcd 40 6)   ; 1x
;; (gcd 6 4)    ; 1x
;; (gcd 4 2)    ; 1x
;; (gcd 2 0)
;;
;; remainder is evaluated 4 times


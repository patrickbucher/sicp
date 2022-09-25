(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 50 20 10 5 5 1 0.5))

(define ch-coins (list 50 20 10 5))

(define (count-change-us amount)
  (cc amount us-coins))

(define (count-change-uk amount)
  (cc amount uk-coins))

(define (count-change-ch amount)
  (cc amount ch-coins))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount (except-first-denomination coin-values))
	    (cc (- amount (first-denomination coin-values)) coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))

;; (count-change-us 100)
;; 292
;; (count-change-uk 100)
;; 44620
;; (count-change-ch 100)
;; 49

(define (reverse items)
  (define (next original reversed)
    (if (null? original)
	reversed
	(next (cdr original) (cons (car original) reversed))))
  (next items '()))

;; (reverse us-coins)
;; (1 5 10 25 50)
;; (cc 100 (reverse us-coins))
;; 292
;; (cc 100 (reverse uk-coins))
;; 44620
;; (cc 100 (reverse ch-coins))
;; 49
;;
;; The order of the coins does not matter, because all combinations are tried.

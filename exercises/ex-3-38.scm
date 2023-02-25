(load "lib/permutation.scm")

(define balance 100)

(define (peter balance) (+ balance 10))
(define (paul balance) (- balance 20))
(define (mary balance) (- balance (/ balance 2)))

(define (apply transactions balance)
  (if (null? transactions)
      balance
      (apply (cdr transactions) ((car transactions) balance))))

(define (pipeline procs acc)
  (if (null? procs)
      acc
      (pipeline (cdr procs) ((car procs) acc))))

(define all-proc-orders (permutate (list peter paul mary)))
(define all-outcomes (map (lambda (procs) (pipeline procs balance)) all-proc-orders))

;; a)
;; all-outcomes
;; (45 35 45 50 40 40)

;; b) The implementation above is referentially transparent, so
;; interleaving should not create any further outcomes.

(load "lib/concurrency.rkt")

(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
		  (lambda () (set! x (* x x x))))

;; building blocks:
;; a: first set!
;; b: computation (* x x)
;; c: second set!
;; d: computation (* x x x)

;; permutations:
;; (a b c d) (a b d c) (a c b d) (a c d b) (a d b c) (a d c b)
;; (b a c d) (b a d c) (b c a d) (b c d a) (b d a c) (b d c a)
;; (c a b d) (c a d b) (c b a d) (c b d a) (c d a b) (c d b a)
;; (d a b c) (d a c b) (d b a c) (d b c a) (d c a b) (d c b a)

;; a must happen after b, and c must happen after d
;; see lib/permutations.scm -> before?
;; (before? (before? (permutate '(a b c d)) 'b 'a) 'd 'c) 
;; ((b a d c) (b d a c) (b d c a) (d b a c) (d b c a) (d c b a))

;; 1) (b a d c): 1000000
;; 2) (b d a c): 1000
;; 3) (b d c a): 100
;; 4) (d b a c): 1000
;; 5) (d b c a): 100
;; 6) (d c b a): 1000000


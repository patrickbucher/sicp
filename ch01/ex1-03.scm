(define (sum-square x y)
  (+ (* x x) (* y y)))

(define (sum-square-max-two a b c)
  (cond ((and (< a b) (< a c)) (sum-square b c))
        ((and (< b a) (< b c)) (sum-square a c))
        ((and (< c a) (< c b)) (sum-square b c))))

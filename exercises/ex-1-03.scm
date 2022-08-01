(define (sum-square-two-biggest a b c)
  (cond ((< a (max b c)) (sum-square b c))
	((< b (max a c)) (sum-square a c))
	((< c (max a b)) (sum-square a b))))

(define (max a b)
  (if (> a b) a b))

(define (sum-square a b)
  (+ (* a a) (* b b)))

# Theory

## Evaluation Order (p. 13-17)

The evaluation of an expression can be performed as follows:

- Applicative-Order Evaluation
    - "evaluate the arguments and then apply"
- Normal-Order Evaluation
    - "fully expand and then reduce"

Given the definitions:

```scheme
(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
```

The expression:

```scheme
(f 5)
```

…is evaluated as follows using Applicative-Order Evaluation:

```scheme
(sum-of-squares (+ 5 1) (* 5 2))

(sum-of-squares 6 10)

(+ (square 6) (square 10))

(+ (* 6 6) (* 10 10))

(+ 36 100)

136
```

…and as follows using Normal-Order Evaluation:

```scheme
(sum-of-squares (+ 5 1) (* 5 2))

(+ (square (+ 5 1)) (square (* 5 2)))

(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))

(+ (* 6 6) (* 10 10))

(+ 36 100)

136
```

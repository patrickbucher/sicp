#!/usr/bin/env python3

def sqrt(x, n=10):
    assert x > 0
    y = 1
    for i in range(n):
        guess = x / y
        y = (y + guess) / 2
    return y


if __name__ == '__main__':
    print(sqrt(2))
    print(sqrt(16))
    print(sqrt(64))

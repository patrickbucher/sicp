#!/usr/bin/env python3

def sqrt_n(x, n=10):
    assert x > 0
    y = 1
    for i in range(n):
        guess = x / y
        y = (y + guess) / 2
    return y


def sqrt_e(x, e=1e-6):
    assert x > 0
    y = 1
    while abs(x - y**2) > e:
        guess = x / y
        y = (y + guess) / 2
    return y


if __name__ == '__main__':
    print(sqrt_n(2))
    print(sqrt_n(16))
    print(sqrt_n(64))
    print(sqrt_e(2))
    print(sqrt_e(16))
    print(sqrt_e(64))

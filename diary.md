# 2022-08-28 (Su)

I read section 1.3.3, which introduces the half-interval method for finding
roots of equations (where `y=f(x)=0`). The next example is about finding fixed
points, i.e. finding an `x` for which `x=f(x)` holds true.

I understand the reasoning behind the first example, but I have no intuition for
how the algorithm to find fixed point works.

# 2022-08-27 (Sa)

I read about `lambda` and `let`; the latter only being syntactic sugar for the
former. Unlike in Clojure, symbols bound earlier in the `let` form do _not_
conceal symbols with the same name. Instead, bindings created in `let` are only
available in its body.

I solved exercise 1.34, which I first got completely wrong; I assumed an endless
recursion, just because I saw similar exercises before.

I also wrote a function to compute the solution(s) for square equations. Since
there are 0, 1, and 2 possible solutions based on the value of the
determinant—for which `let` came in handy—the function returns a list of
according length. (For this, I had to use `cons`, which wasn't introduced in
SICP yet.)

# 2022-08-26 (Fr)

I managed to solve exercise 1.33. The iterative approach of `accumulate` was
easy to extend with the filter logic; for the recursive approach, I didn't find
a solution.

Now up to lambdas!

# 2022-08-25 (Th)

I worked through exercise 1.32, which generalises the ideas of the sum and product
procedures into a accumulate procedure. The second part of the exercise, which
is to write an iterative procedure starting from the recursive one, was doable
with the `iter` function I used yesterday.

# 2022-08-24 (We)

I started in the morning with exercise 1.30, which was quite easy. Exercise 1.31
was harder. Since both numerator and denominator could change in every step, I
wondered if I should handle numerator and denominator with the term and the next
procedure, respectively. After figuring out the rules on how to build
numerator/denominator solely based on the current iteration `i`, I was able to
put building the fraction into the term procedure. The next procedure is a
simple increment of `i`.

Even though I didn't need to resort to pen and paper, expanding the formula for
each iteration proofed useful. It also makes sense to define some internal
procedures on the top-level, so that they are easier to be tested in isolation.
(There might be some advanced technique to do that with the REPL; I guess I'll
figure that out later when needed again and again.)

# 2022-08-23 (Tu)

In the morning, I carefully wrote down the integral example, i.e. formula and
code. Then I also wrote down Simpson's Rule, which I expanded on paper. I
figured out that I needed to write a sum procedure that applies a multiplication
to the terms, depending on their index. This `weighted-sum` procedure ended up
having lots of parameters, which probably can be addressed using closures later
on.

The lesson I learned today is: If you write something down, you can see it. If
you only think about it, you cannot see it; observing it in the mind causes
mental load. So write it down to unburden the mind.

# 2022-08-22 (Mo)

Early in the morning, I started reading section 1.3. I read up to exercise 1.29,
which I attempted to do in the evening, but to no avail. I need to work through
it using pen and paper. Or better: I first need to _completely_ understand the
integral example.

The good thing about functional programming is that the abstractions are very
good rather than leaky. If you really grasp a concept, it quickly becomes second
nature to you, and your cognitive load diminishes. Every time so far an exercise
poses a cognitive load too high for me, I just did not fully understand the
example demonstrated before.

So I need to go back to the example and work through it carefully. If I really
understand it, exercise 1.29 won't be an issue.

# 2022-08-21 (Su)

I worked through exercise 1.27 and extended my solution to a procedure that
searches for Carmichael numbers in a given range. I used a naive prime test to
check numbers passing the fermat test for primality.

Later, I worked on exercise 1.28, which is quite hard. My biggest problem is
that the exercise conflates the idea of the Miller-Rabin test with the existing
implementation of `expmod`, adding accidental to the inherent complexity of the
task.

Even though I'm not able to get the exercise done yet, I found some useful
technique to avoid multiple computations of a value that both needs to be
returned and to be predicate checked: The predicate function not returns true or
false, but the input parameter or false, depending on which result signifies
that the superordinate procedure shall stop the computation. However, such
predicate functions are better written as internal procedures rather than
standalone procedures, because the return value requires interpretation.

In the evening, I finally got the implementation together. I tested it with the
Carmichael numbers below 10'000 (all false) and with some big prime numbers (all
true).

Another source of confusion was the phrase "x is congruent to 1 modulo n". I
first thought that `(= (remainder x n) (remainder 1 n))` was meant, which of
course makes no sense at all. It's rather `(= (remainder x n) 1)`, which makes
perfect sense.

Exercise 1.28 just had too many layers of confusion, which I needed to entangle
one by one.

# 2022-08-20 (Sa)

I worked through exercise 1.26 by demonstrating that the implementation shown
doubles the procedure call with every step, whereas the old implementation only
requires a single invocation, which is much more efficient in terms of space and
time.

# 2022-08-19 (Fr)

I picked up exercise 1.24 from yesterday and ran the Fermat test with rather
large prime numbers and different amounts of tests. I didn't bother to do a lot
of calculations of expected vs. actual growth in runtime.

I started with exercise 1.25, for which I stepped through the function calls in
detail. The solution using `fast-expt` requires less steps and space.

# 2022-08-18 (Th)

I started with exercise 1.24 in the morning.

# 2022-08-17 (We)

I worked through exercise 1.23 and optimized the `smallest-divisor` procedure,
which resulted in a speedup of 30 to 50 percent.

# 2022-08-16 (Tu)

I realized that exercise 1.22 was way easier to implement than I thought
yesterday. I implemented the solution and performed the checks in the given
number ranges (10k, 100k, 1M). However, CPUs are too fast nowadays to draw any
conclusions about runtime performance in those ranges. And bigger ranges are
impractical with the given implementation, which reports on each number that was
checked.

# 2022-08-15 (Mo)

I worked through section 1.2.6, and now understand the logic behind the Fermat
test. I worked through exercise 1.21. I also started with exercise 1.22, which
looks a bit odd to me: it's the first exercise that works with side-effects
rather than return values, and the procedure I'm supposed to write should deal
with both.

# 2022-08-14 (Su)

I worked through the rather tedious exercise 1.20, which requires tracing a GCD
procedure using normal-order evaluation, which took me quite some time. Working
through the applicative-order evaluation in the second part of the exercise was
much less work, which presumably is the points the authors wanted to make.

I also quickly read through section 1.2.6 about primality tests to get a rough
overview on the topic.

# 2022-08-13 (Sa)

I struggled with exercise 1.19, because I wasn't really able to figure out what
I needed to do. After trying different approaches, I peeked into a solution,
which showed that one of my approaches was actually sensible; I just needed to
work through it completely. Later in the evening, I was able to do everything on
my own, and I wrote down the entire calculation using LaTeX. The implementation
is extremely fast, as some tests with large Fibonacci numbers showed.

# 2022-08-12 (Fr)

Today, when I wanted to work on exercise 1.18, I figured out that I already
solved it. So I was able to take a step back to implement it as a recursive
procedure, which actually is the solution to exercise 1.17.

Having figured out the iterative solution, going back to the recursive approach
was not easy at first; however, the solution looked very easy afterwards.
Lesson: First, implement the procedure recursively, and then re-implement it
using tail calls. The other way seems harder to me.

# 2022-08-11 (Th)

In the morning, I struggled with exercise 1.17. In the evening, I finally was
able to solve it. When working on it on paper, I realized that I need two
accumulators: one to account for halving b resp. doubling a, and one for sums,
i.e. decrementing b while summing up the original a.

# 2022-08-10 (We)

With pen and paper, and some thinking and thinkering, I was able to solve
exercise 1.16. Now I'm further in SICP then I was at my last attempt.

# 2022-08-09 (Tu)

I did exercise 1.15, whose definition I first struggled to understand.

# 2022-08-08 (Mo)

I did exercise 1.14, which took me quite long to do.

# 2022-08-07 (Su)

I did exercise 1.12, which was fairly easy. Exercise 1.13 was rather hard, but I
eventually figured out the proof, which I also wrote down as a nice LaTeX
formula.

# 2022-08-06 (Sa)

I worked on exercise 1.11, which took me a long time, but I managed to finish it
eventually on my own.

# 2022-08-05 (Fr)

I worked on exercise 1.9, which was quite easy. Exercise 1.10 was more tedious
and more difficoult. I was unable to figure out the mathematical definition of
h(n), which was recursive, after all.

# 2022-08-04 (Th)

I read about recursion and tail-call optimization up to page 36 and implemented
the two factorial procedures.

# 2022-08-03 (We)

I worked through exercises 1.7 and 1.8. Then I read up to page 31.

# 2022-08-02 (Tu)

Today, I only read the section on the iterative computation of square roots
(using the "Newton method"). I first implemented the algorithm iteratively in
Python, then typed in the Scheme code. I also worked through exercise 1.6.

# 2022-08-01 (Mo)

I read the paragraph about conditionals and predicates, and worked through
exercises 1.1 to 1.5.

# 2022-07-31 (Su)

I started reading the book in the morning and then set up this new repository.
I'm getting acquainted with Geiser again and took some notes about the basic
usage.

I read until p. 17 about applicative-order and normal-order evaluation, and took
some notes.

# 2022-07-30 (Sa)

I deleted my old SICP repository (containing some exercises on the first
chapter) both on GitHub and on my backup computer, however not on the
corresponding backup disk.

I figured out how to install MIT Scheme on Arch Linux, which now requires an
AUR package, since MIT Scheme is no longer among the officially supported Arch
Linux packages.

I also updated my setup instructions for Geiser and started with a fresh Emacs
setup.

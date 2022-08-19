# 2022-08-19 (Fr)

I picked up exercise 1.24 from yesterday and ran the Fermat test with rather
large prime numbers and different amounts of tests. I didn't bother to do a lot
of calculations of expected vs. actual growth in runtime.

I started with exercise 1.25, for which I'll step through the function calls in
detail tomorrow, in order to compare those two procedures.

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

# 2022-09-16 (Fr)

I worked on exercise 2.10, but had an issue with the `mul-interval` procedure I
typed in the other day; I obviously misplaced a parenthese in the `let` form,
which could happen easily. (Clojure's `let` needs way less parentheses, which
makes it easier to use.) After that was fixed, the exercise was easy. However, I
don't now what to return if a division cannot be computed, so I resorted to
`#f`.

I also started with exercise 2.11, which needs a bit further reasoning.

# 2022-09-15 (Th)

I started with exercise 2.9. The stated issue intuitively made sense to me, but
I had no idea on how to proof it. So I made two examples for each operation
(addition and multiplication), where the variables kept their values, but
switched their widths. The addition yielded the same result, but not so for the
multiplication, which proofed the point. I started writing the formulas down in
LaTeX, after I did in on paper. (I'll have to finish it later.)

I finished exercise 2.9 during my lunch break.

# 2022-09-14 (We)

I read the section about interval arithmetic and thought to have spotted some
serious grammar issues there ("She reasons that the minimum value the sum could
be is the sum of the two lower bounds and the maximum value it could be
is the sum of the two upper bounds.", p. 94) After checking the errata and
finding nothing, I read the sentence again, and then it made sense to me: I
mentally grouped the words the wrong way: "the minimum value; the sum; could be;
is the sum…", which doesn't make sense, but when I read it as "the minimum value
the sum could be; is the sum…". This sentence is like a flip-flop picture; if
you see the wrong thing, look away, look at it again, and then you'll see the
right thing. At least for a non-native English speaker like me…

However, I worked through the example code and finished exercises 2.7 and 2.8,
which were rather easy.

# 2022-09-13 (Tu)

I once again stepped carefully to all the substitutions and figured out what I
already read yesterday: The Church number `n` is the n-th application of `f(x)`.
After I was able to give a definition of `one` and `two` using Church numerals,
the `add` procedure was quite straightforward. (I first wanted to compose the
first function as many times as the second function indicates, but that is
forbidden by the exercise and also pointless, because the `repeated` procedure
works with actual numbers.) Then I figured out that I only need to compose the
two Church numbers.

This exercise was not only mind boggling, but also very humbling.

# 2022-09-12 (Mo)

In the morning, I started with exercise 2.6 on Church numerals, which is quite
mind boggling. I had to left it unfinished for the time being.

# 2022-09-11 (Su)

I read further in chapter 2, and was astonished that instead of a cons list, one
can also use closures to the same effect, at least in the given example of
rational numbers.

Exercise 2.4 was a bit tricky to understand, but once I grasped the evaluation,
it totally made sense to me. Exercise 2.5 was even trickier. My hunch to apply
prime factorization to the problem proofed to be the right approach, and I was
able to implement the `car` and `cdr` operation by figuring out how many times
the factors 2 and 3 are inside the product `cons`ed together in the first place.
I went from despair to delight within 5 minutes.

Exercise 2.6, dealing with Church numerals, I leave for tomorrow.

# 2022-09-10 (Sa)

I continued reading in chapter 2 and worked through exercises 2.2 and 2.3, which
were rather easy, but also enlightening. This kind of knowledge transfers 1:1 to
object-oriented programming. Polymorphism is easily achieved using procedures.

# 2022-09-09 (Fr)

I read the beginning of chapter 2 again and worked through the rational number
examples. I also did exercise 2.1, which was rather easy.

# 2022-09-08 (Th)

I picked up the binary search from yesterday, but worked with pen an paper this
time. This proofed to be useful, because I didn't quite get the computation of
the next guess quite right last night. Today, it worked after a few tries (I had
to resort to `floor` instead of `round`). Afterwards, I was able to remove quite
some debugging code.

I started reading chapter 2. The numerator/denominator example will be useful
for my next programming class, where I'd like to introduce structures in Go.

# 2022-09-07 (We)

For exercise 1.45, I went back to the previous section to make sense of the
square root computation using average damping. I re-used the code from earlier
exercises to compute the cube, the fourth, and the fifth root using repeated
average damping. However, one repetition (i.e. two calls) was enough to get
converging results on my examples.

In the evening, I worked on exercise 1.46. I first struggled to understand how
I'm supposed to structure the procedure, but my initial idea proofed to be
valid, which I tested with a number guessing game. (I wanted to do it as a
binary search first, but then resorted to simple increment/decrement
improvements, which is good enough to proof the point.) Afterwards, the `sqrt`
and `fixed-point` function were quite easy to implement using the
`iterative-improve` procedure.

This was chapter 1!

I started to implement a binary search for a number guessing game, but the
guesses never converged. So I called it a day.

# 2022-09-06 (Tu)

I worked on exercise 1.44, which wasn't too difficult. However, I wonder how
smoothed functions are used in practice.

# 2022-09-05 (Mo)

Exercise 1.43 was rather easy, using repeated calls to the `compose` function in
the previous exercise. I also wrote an iterative implementation of the
procedure, which worked fine.

# 2022-09-04 (Su)

Exercise 1.40 was a simple application of Newton's method. Exercise 1.41 looked
easy at the beginning, but proofed to be very tricky: The evaluation tree gets
bigger very quickly, because the function calls double on every layer.

Exercise 1.42 introduced the `compose` function, which I already used a lot.

# 2022-09-03 (Sa)

I figured out the problem with the examples from yesterday: I missed to open a
parenthese, so a function was regarded as a number, which explains the error.

I have to step through the examples carefully again, then I can start with the
final exercises of the chapter.

# 2022-09-02 (Fr)

I started with the examples using average damping, but something doesn't work,
and I get some type error I don't understand, even though I just entered the
code from the book. So I guess the test numbers I'm using cause the trouble. I
have to investigate later or tomorrow…

# 2022-09-01 (Th)

Despite my headache, I gave section 1.3.4 on procedures that return other
procedures a first read. Then I looked at the fixed-point idea again from the
section before, which is used for various computations.

I'll play with the examples later, or tomorrow, depending on my headache. Many
exercises are waiting at the end of the chapter.

# 2022-08-31 (We)

I worked throuh exercise 1.39, which required writing a new implementation of
the continued fraction algorithm, because minus instead of plus is used in the
denominator. I mixed up the function calls for the numerator and denominator,
and therefore got random results, unless I called the function with `k=1`. This
exercise also allowed me to repeat the notions of degrees and radians.

I finish August, my first month of daily SICP. Chapter 1 is mostly done, just
one section with seven exercises left. (Probably some really hard ones, but
let's see…)

# 2022-08-30 (Tu)

I finished part b) of exercise 1.37, for which I implemented `cont-frak` using
tail-calls. Calling it for one million iterations takes roughly one to two
seconds, whereas the original recursive approach fails due to a stack overflow.

I started with exercise 1.38, where I struggled with off-by-one errors for the
beginning. I thought I figured it out, but the result converges around 2.5, not
around 2.718, as it should. I need to figure that one out…

Later on, I figured out that my iterative implementation of `cont-frak` only
worked for the Golden Ratio, because only 1 is used there as the numerator and
denominator. However, the implementation failed for Euler's number.

So I need to re-visit exercise 1.37 b), and then can check my solution with
Euler's number in exercise 1.38, which I apparently solved correctly using the
recursive algorithm from exercise 1.37 a).

In the evening, I figured out that I needed to approach the iterative algorithm
_backwards_, i.e. start with `k` and iterate towards 0; building up the fraction
from the inside-out.

# 2022-08-29 (Mo)

I worked on exercise 1.37, which wasn't that hard, after all. I only managed to
do part a in the morning. In part b, I have to change the implementation from a
recursive one to an iterative one, which I leave for the evening or tomorrow.

# 2022-08-28 (Su)

I read section 1.3.3, which introduces the half-interval method for finding
roots of equations (where `y=f(x)=0`). The next example is about finding fixed
points, i.e. finding an `x` for which `x=f(x)` holds true.

I understand the reasoning behind the first example, but I have no intuition for
how the algorithm to find fixed point works.

I solved exercises 1.35 and 1.36, which where rather easy warm-up exercises.
Exercise 1.37, which I leave for tomorrow, looks considerably harder.

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

# 2023-07-18 (Tu)

Today, I just read a couple of pages. I had a look at Clojure again, making
corrections to my old notes.

# 2023-07-17 (Mo)

Back to Scheme, I implemented with the prime sieve example, which was extremely
enlightening. I'd like to implement it in other languages, too; with or without
streams.

# 2023-07-16 (Su)

Having solved the memoization issue last night, I continued with my Go
implementation of Cells and Streams. In order to implement the map operation for
streams, I had to slightly change my StreamCdr implementation, which now
returns a delayed stream instead of a stream. But the framework still holds up.

# 2023-07-15 (Sa)

I implemented cons cells and streams in Go, just to get a better understanding
of it. I still don't fully understand this particular memoization mechanism, but
I'm getting there.

# 2023-07-14 (Fr)

I played around with the examples about infinite streams, but didn't have the
time to look deeper into it, so far.

# 2023-07-13 (Th)

Today, I was only able to read some pages about infinite streams. The concept is
very interesting, and especially enlightening was the way in which an infinite
Fibonacci sequence was created; probably the most elegant implementation I've
seen so far. The stream as an abstraction provides most of the functionality,
computing the next item is just a tiny lambda expression. I'm looking forward to
implement this technique in other languages, too.

# 2023-07-12 (We)

I worked through exercise 3.52, but was unable to test the memoized
implementation described in the paragraphs before. However, the MIT Scheme
implementation seems to be memoized, otherwise I'd have different results: the
side effect of accumulating the sum would have occurred multiple times.

# 2023-07-11 (Tu)

I worked through exercise 3.51, which first puzzled me a bit, but then made
perfect sense after watching closer at the evaluation of the expressions.

# 2023-07-10 (Mo)

I worked through exercise 3.50. I did not unterstand the purpose of the
procedure until I started using it, for which I put some helper procedures
described earlier into a library file for reuse.

# 2023-07-09 (Su)

After almost four months, I'd like to come back to SICP. I quit my main job,
mostly finished the first project of my own company, and I won't be teaching
classes for six weeks now. This gives me time to pick up functional programming
again. My plan is to continue with Erlang, Elixir, and Clojure; and Streams are
a subject that will be useful for those languages, too.

I read the first four pages of section 3.5. Then I re-implemented basic
operations like `prime?`, `accumulate`, and `enumerate` to get back into the
matter. I got a bit rusty with Emacs, but I was quickly back into programming in
Scheme.

The imperative and functional examples of filtering primes demonstrated the
issue very well that is to be solved with streams. Therefore, I am already happy
with my decision to get back into SICP in order to finally finish chapter 3.

# 2023-03-12 (Su)

I worked through exercises 3.48 and 3.49. Now the bookmark ist set to section
_3.5 Streams_, and it probably will remain there for a couple of weeks of
months. If I'd like to go into LISP or Clojure anytime soon, I first will work
through this section. But then I got out of SICP what I wanted.

Time for a break.

# 2023-03-11 (Sa)

After the enforced break yesterday, I picked up exercise 3.47, part b. I modeled
it roughly after part a, but didn't bother to refine it further.

Tomorrow, I plan to do the last two exercises of the _Concurrency_ section. Then I
leave the next 40 or so pages about _Streams_ for another time. After more than
seven months of SICP, I feel quite comfortable that I'll be able to do so, if I
actually want to do so.

I'd like to shift my focus to more practical concerns, for the moment.

# 2023-03-10 (Fr)

The day had to come: no SICP today due to a heavy flu that prevented me from
teaching. I barely could keep a glass of water, but it's already improving. So I
hope for some SICP tomorrow!

# 2023-03-09 (Th)

I simplified my code for exercise 3.47 by eliminating the hash and the
application as a stack. Now it just demonstrates the principle, but works.

# 2023-03-08 (We)

I extended the given mutex implementation with a message called `free?`, which
returns if the mutex is not acquired (`true`) or acquired (`false`).

Trying to implement the `acquire` procedure, I noticed that I got my data
structure wrong, which I corrected.

# 2023-03-07 (Tu)

I continued with exercise 3.47, for which I now store the created mutexes in a
hash table. I'll need another procedure for the mutex, which tells me, whether
or not it is already acquired.

# 2023-03-06 (Mo)

My idea for exercise 3.47 is to manage stacks using a semaphore. However, I
first need to figure out how to manage those mutexes together with the stacks in
a data structure.

# 2023-03-05 (Su)

I read further about concurrency, and tried to demonstrate the issue with the
non-atomic `test-and-set!` procedure for exercise 3.46, but failed to do so.
However, the issue is quite clear, so I explained how a race condition can
happen.

For exercise 3.47, I started to implement a sempahore. This is not so easy, and
I think that I'll try out a hash table (provided by Racket) for it. But first, I
need to think about it.

I also had an idea how to simplify my implementation of permutations last
Thursday night. Today, I implemented it: it worked perfectly! I'm now down from
almost 30 to 11 lines.

# 2023-03-04 (Sa)

I worked through exercise 3.45, which creates a deadlock by trying to acquire
the same mutexes mutex twice.

# 2023-03-03 (Fr)

I worked through exercise 3.44, which looks fairly similar to exercise 3.43, but
has an interesting little difference with large consequences.

# 2023-03-02 (Th)

I re-read the passage from yesterday, worked through the example, and managed to
do exercise 3.43.

# 2023-03-01 (We)

After a bad night, I just read the section about complexity of using multiple
shared resources.

# 2023-02-28 (Tu)

I worked through exercises 3.41 and 3.42 by reasoning rather than by running
lots of experiments.

# 2023-02-27 (Mo)

I first put the two files containing Racket concurrency procedures into the same
file, which will require less import code in the exercises.

I started with exercise 3.40, for which I built the permutations of the events.
Since some events can only happen after certain other events, I needed to filter
those permutations by some constraints, for which I introduced the `before?`
predicate. That helped me to eliminate a lot of impossible execution orders (a
`set! x` operation can only happen after `x` has been computed). The rest of the
exercise then wasn't that hard.

# 2023-02-26 (Su)

I use Racket again for the concurrency examples. Unfortunately, MIT Scheme does
not provide the concurrency primitives needed. However, with Racket, I need to
resort to some alternative implementations (e.g. `mlist` instead of `list`) for
the serializer code.

Having [done this](https://stackoverflow.com/a/75570962/6763074), I was able to
solve exercise 3.39, for which the permutation function from yesterday was
rather helpful. (I just needed to eliminate the permutations describing a
succession that is not permitted by the serialization.)

# 2023-02-25 (Sa)

I started with exercise 3.38. However, I didn't just want to reason, but
actually run all the possible _permutations_ of the three procedures against the
original balance.

Building the permutations was harder than I thought, but I'm almost there…

I re-discovered the `accumulate` procedure from chapter 2. It behaves almost
like `map`, but appends all results to the same data structure. This allowed me
to finish the permutation procedure.

I also implemented a `pipeline` procedure, which applies a series of procedures
to a value.

With all those things combined, I was able to compute all the possible outcomes
of the functions being run in different orders.

This exercise was quite enlightening—but only because I solved it
programmatically.

# 2023-02-24 (Fr)

Having read most of the section about _Propagation of Constraints_ yesterday, I
typed in the example code today. Fortunately, I got it to run quite quickly.

Now I'd like to push through the next five exercises, so that I can finally get
started with the section about concurrency, which is one of my major interests.

Having rushed through those exercises, I'm now ready for the concurrency part.

# 2023-02-23 (Th)

I re-structured the given code and filled in some missing pieces. Unfortunately,
the example `examples/simulation.scm` causes an out of memory error.

I'll try to test the two exercise 3.28 and 3.29 in a similar manner, hoping that
no out of memory error will be caused.

For exercise 3.30, I'll try to implement the ripple carry adder; hopefully in a
testable manner.

Then exercises 3.31 and 3.32 are only some questions to be answered.

## Hiatus

Now that my motivation for SICP is depleted for the moment, and that I mostly
got out of it what I wanted, I'll start a hiatus of unknown length. Here's what
I'll do instead: Learning Ruby, Puppet, and Podman. That'll bring me ahead
professionally. Erlang, Clojure, and Haskell—I'd like to learn those later.

## No Hiatus

I just couldn't let go, so I once again tried to get the simulation to run.
Having struggled with infinite loops for a long time, I copied the sample
code(!) from a solution website. I still don't know what I did wrong, but with
the new version, I got everything to run.

Afterwards, I was able to finish exercises 3.28 and 3.29, and for exercise 3.30,
I'm finally able to _program_ again!

I managed to do the rest of the exercises. I'm now able to go through the next
section called _Propagation of Constraints_, which I'd like to do quite
pragmatically. So I'll be staying in for the good stuff to come…

# 2023-02-22 (We)

I, once again, looked into the code for digital circuits, and noticed that
there's a global `the-agenda` variable, which I'll need to introduce into the
exercise code. My motivation for this part of the book is rather low, and so it
will be for the next one. The reason I'm working through SICP is that I want to
learn functional programming. The entire chapter is rather about imperative
programming, i.e. programming with side effects.

So I'll try to summon all my remaining motivation for those two sections when
I'm back home. I just need to make it through to the concurrency section. I
really want to finish chapter 3. Then I'll consider doing something else.

# 2023-02-21 (Tu)

Today, I started with exercise 3.30. I wrote down the code for both the half
adder and the full adder, and have a rough idea on how to combine multiple full
adders to a rippele carry adder. I also computed the delay for the adder, based
on its components.

# 2023-02-20 (Mo)

So I obviously didn't even start my hiatus. Quite to the contrary: I worked
through exercise 3.28 and 3.29. The digital logic and computation (3.29) was
rather easy. However, the implementation doesn't work yet, probably because the
provided example code is incomplete, or because I did a mistake when I typed it
in. I'll dig deeper into it tomorrow.

# 2023-02-19 (Su)

Despite my planned hiatus, I started reading _A Simulator for Digital Circuits_
yesterday. The code needed to run the examples and exercises is scattered
throughout the entire section. So I read through it and extracted the code,
which is stored in `lib/circuits.scm`.

Here's my plan: After my hiatus, I'll try to work through the section
aforementioned. If the code provided actually allows me to work through the
examples and exercises, I'll work through that section as usually. If the
provided code is incomplete and requires me to do additional research on the
Internet, I skip to the next section: _Propagation of Constraings_.

Here, I'll do the same: In a first step, I read through the section and extract
the code.  If this code provides everything to do the examples and exercises,
I'll work through it carefully. Otherwise I step over to the next sub-chapter
_Concurrency: Time Is of the Essence_.

That particular section, and the ones titled _Streams_, is what I really want to
get out of SICP. Chapters 4 and 5 are interesting from a computer science
perspective. But after chapter 3, I have under my belt what I need to be
productive using a functional programming language, be it Scheme, Racket,
Clojure, Erlang, Elixir, Haskell, OCaml, Elm, or whatever.

# 2023-02-18 (Sa)

I worked through exercise 3.25, which looked quite hard at the beginning, but
became easier when I figured it out that a recursive implementation supporting
arbitrary layer requires _less_ code than an implementation with a fixed number
of multiple layers.

I also worked through exercise 3.26, for which I first wanted to use multiple
cons cells. But then I realized that I actually was creating a list, so I
implemented the nodes directly as a list, with some accessor procedures.

Exercise 3.27 is the last one of the section about tables. So I did that quickly
without drawing any diagrams. (I already knew the concept of memoization.)

## Hiatus

The next section is about a simulator for digital circuits, and it is quite
long. I'm going on a holiday tomorrow (for the first time since summer 2021).
This is the perfect time for a hiatus.

In the winter of 2020/2021, I did a lot of Coursera MOOCs, mostly about machine
learning. However, I also started the Course "Programming Languages, Part A".
Having been exhausted from watching videos the whole time, I quit the course
after the first major exercise.

Now it's the perfect time to get back into it. The course uses ML as a teaching
language. I wonder how much easier that will be for me now that I worked on SICP
every day for half a year.

I'll redo the first homework with some extra tasks during my holiday. When I
come back next week, I'll decide how to proceed. SICP, "Programming Languages,
Part A", neither, both, or something totally different.

# 2023-02-17 (Fr)

I worked through the examples with two-dimensional tables and did exercise 3.24,
which was rather easy.

# 2023-02-16 (Th)

I started reading the section about tables, but didn't implement anything yet.

In the eveing, I typed in the code for the one-dimensional table and tried it
out.

# 2023-02-15 (We)

I finished exercise 3.23, but only noticed upon finishing the
`rear-delete-deque!` procedure, that an O(1) implementation is not possible with
the current design; it would require a double-linked list, which could be
designed with two pairs per entry:

1. The first pair contains the actual value in the `car` cell and a pointer to
   the other pair in the `cdr` cell.
2. The second pair contains the pointer to the previous pair in the `car` cell,
   and the pointer to the next pair in the `cdr` cell.

This, of course, requires more pointer management for each step. I'll attempt it
as an additional exercise.

I began this implementation on the train ride in the morning, and finished it on
my way back in the evening.

# 2023-02-14 (Tu)

I started with exercise 3.23, for which I implemented the selectors and insert
procedures; the delete procedures still need to be done.

# 2023-02-13 (Mo)

I worked through exercise 3.22, which I finished rather quickly.

# 2023-02-12 (Su)

I read the section about mutation and assignment. For exercise 3.20, I didn't
draw the diagram, but tried out the code.

I read the section about queues and implemented the example. I first struggled a
bit with exercise 3.21, but then figured out that the subsequent call to the
print procedure requires a pseudo-front pair made up ad hoc, after which
everything fell into place.

# 2023-02-11 (Sa)

After a late start, I managed to work through exercise 3.18 fairly quickly. The
next exercise, 3.19, requires to re-implement the same algorithm in constant
space. I'll think about it for a moment, hoping a solution might pop up
spontaneously.

In the afternoon, I had an idea on how to solve exercise 3.19. I sketched a plan
for a tail-recursive procedure that operates in two modes: advance mode, to move
to the next cell in the list (the lead cell), and check mode, to test the former
cells for equality against the lead cell.

I implemented the procedure in the evening, and I got it to work rather quickly.

# 2023-02-10 (Fr)

Exercise 3.17 was quite challenging—and rewarding! First, the cache mechanism
didn't work, so I thought that I still had major misconceptions about the
scoping rules. However, the problem was not my implementation of the caching
mechanism, but the way I used it: The recursive `count-pairs` procedure created
a new cache for every call; so I had to add an internal procedure that re-uses
the cache.

The failing examples of exercise 3.16 worked correctly with my new
implementation, except for the example that lead the old `count-pairs` procedure
into an infinite loop. However, the problem was not my implementation, but the
debug messages that tried to print this infinite structure, which of course
didn't work.

So I'm glad that I understood the mechanics—and learned more about problematic
list structures.

# 2023-02-09 (Th)

I worked through exercises 3.15, which was rather easy, and exercise 3.16, which
took me quite some time. For the latter, I only made progress when I used
mutations; the procedure works fine for structures created with `list` and
`cons` alone.

# 2023-02-08 (We)

I worked thorugh exercises 3.13 and 3.14. Again, I only drew diagrams on paper,
and wrote down the steps using the substitution model, which, of course, doesn't
cover everything that happens when using `set-cdr!` and the like.

# 2023-02-07 (Tu)

I read the section about mutable list structures and worked through exercise
3.12. However, I only drew the box and pointers diagrams on paper, and put the
code with my textual interpretation into the repo. This pragmatic approach cuts
out lot of the busywork.

# 2023-02-06 (Mo)

I quickly read the final part of section 3.2 and took some notes for the
exercises. I did _not_ draw the diagrams. It is important to me to keep going,
and having programmed for almost 20 years, a lot of it in object-oriented
programming languages, I understand the principles of environments, namespaces,
and the like.

The upcoming topics look very interesting to me:

- mutable list structures (with shared parts), queues, and tables
- a digital circuit simulator
- concurrency and shared state
- streams (lazy and infinite ones)

So I _must_ keep going.

# 2023-02-05 (Su)

I read (and re-read) the section about the environment model of evaluation and
the rules of evaluation in such an environment. Exercise 3.9 requires me to draw
such environment diagrams, which is rather easy on paper, but hard on the
computer. So I'll give [PSTricks](https://tug.org/PSTricks/main.cgi/) a try.

Having tried PSTricks, I came to the conclusion that doing exercises 3.9, 3.10,
and 3.11 _properly_ with drawings is a lot of work. So I'll just draw them on
paper and write my conclusions in a text file for every exercise.

# 2023-02-04 (Sa)

Having read the two exercise instructions yesterday, I was already able to think
about possible solutions. The exercises seemed rather hard yesterday, but I was
able to solve them quickly today.

For exercise 3.7, I first re-implemented exercise 3.3 to gain more clarity. I
think the code was simpler afterwards, however, I did not check the original
code of exercise 3.3, to keep my head clear.

Exercise 3.8 was surprisingly simple and demonstrated the perils of state very
well.

# 2023-02-03 (Fr)

I started reading the section about the costs of introducing assignments, and
tried to make sense of the examples.

# 2023-02-02 (Th)

I worked through exercise 3.6, which I solved by storing all the numbers with
top-level `define`s. This is easy, but pollutes the namespace.

# 2023-02-01 (We)

I worked on exercise 3.5, which I first thought was about calculus, but it
looked [quite similar](https://paedubucher.ch/simpi/) to me after I've
completely read it.

I had some issues with generating random numbers: the given procedure behaves
differently when invoked with integers and decimals. The exclusion of the upper
bound of 4, for example, never yields a bigger value than 3, but could be up to
3.999 for decimals, which makes some difference.

# 2023-01-31 (Tu)

I worked through the examples about Monte Carlo experimants to find Pi using the
Cesaro method. Next up: exercise 3.5.

# 2023-01-30 (Mo)

I worked through exercises 3.2 and 3.3. The last one already gave me a glimpse
on the perils of state.

# 2023-01-29 (Su)

I went through the various bank account examples and did exercise 3.1. It is
very easy to imitate some object-oriented programming style with functions
alone.

# 2023-01-28 (Sa)

For exercise 2.95, I performed the multiplications manually, and then using code
from previous exercises. I didn't bother to perform the entire division by hand
afterwards, or to trace the function calls; but I noticed the problem that is
mentioned in the exercise.

After some struggles with the integerizing factor and the application of GCD to
a list, I also managed to do exercise 2.96. One exercise and two pages are left.

I also worked through exercise 2.97. The main struggle was—again—the type
system, which always got in the way in this last part of the chapter.

This concludes chapter 3; and I'm glad that I no longer have to deal with the
generic operations table and all those incompatible operations defined over the
last couple of weeks.

In the evening, I wrote about my (almost) six months of SICP. I also started
reading chapter 3 and typed in the first examples.

# 2023-01-27 (Fr)

I did exercise 2.94, which was rather easy. However, I did not install the
procedure in the overall system; I'll re-use the code directly if needed in
further exercises.

So three full days left for three more exercises; I'm on track.

# 2023-01-26 (Th)

Finally, I finished exercise 2.93. It took be a bit longer than expected,
because the generic operations for polynomials and term lists are all scattered
around the exercises, and many procedures are never properly installed.

The remaining four exercises in the chapter look rather independent of those
generic procedures, so I hope I can finish up chapter 2 until the 31st of
January, which would exactly mark six months since the beginning of my effort.

# 2023-01-25 (We)

Since there's a lot of boilerplate code involved when dealing with the
dividends, divisors, and variables of the rational functions, I wrote a generic
combine procedure that deals with all the unwrapping and wrapping. I got the
resulting type right, now I can further compute with the results of my
procedure.

Implementing the other three operations will be an easy task.

# 2023-01-24 (Tu)

I implemented the addition of rationals, but haven't yet figured out how to
build up the resulting expression with the correct type tags.

# 2023-01-23 (Mo)

I started working on exercise 2.93, which appears to be solvable.

# 2023-01-22 (Su)

I read the next section in chapter two, which leads to exercise 2.92 that ends
with the comment "This is not easy!". I read the rest of the chapter, and I'm
glad to see, that the further examples and exercises do not depend on the
completion of exercise 2.92.

So I have to face a tough decision: Skipping exercise 2.92 (after some initial
thinking) and finishing the chapter, or giving up at this point.

Having written down my notes on exercise 2.92, I came to the conclusion that it
is too hard for me now, because I have no idea how to implement factorization of
terms. So I skip exercise 2.92 and attempt the rest of the chapter.

Having glanced at chapter 3, I came to the conclusion that continuing with
chapter 3 is way more important for acquiring functional programming skills than
sitting over a generic arithmetic system for much longer. So I'll try to do the
rest of chapter 2, but shortcut the exercises if they focus too much on maths
rather than programming.

I also glanced at chapter 4 and 5, in which compilers and computer architecture
are the main topics. Those are interesting, but I'll consider a break after
chapter 3.

# 2023-01-21 (Sa)

After some struggles with the result data structure, I was able to finish
exercise 2.91. I also figured out a weakness of the current implementation of
the subtraction of counted term lists: Elements with order 0 are retained, and
must be filtered out; otherwise the polynomial division won't come to an end.

# 2023-01-20 (Fr)

I re-implemented the negation of counted terms lists, which is needed to compute
the rest terms for exercise 2.91. I just need to write a wrapper for
multiplication, and to put together the pieces, then I'm done.

# 2023-01-19 (Th)

I read exercise 2.91, then performed a manual polynomial division on paper, just
to make sure that I understand it. Then I typed in the given code.

# 2023-01-18 (We)

I finally finished exercise 2.90 by implementing the addition and multiplication
of polynomials using generic term lists.

# 2023-01-17 (Tu)

I started re-implementing the polynomial package from the example code. The
tasks seems easy, now that I have two properly tested implementations for the
term lists.

# 2023-01-16 (Mo)

I started implementing the package for the counted term list representation.
Unfortunately, the addition results are incorrect, which I need to check in
detail.

In the evening, I was able to figure out the addition issue, and I also
implemented the multiplication.

Now I can re-write the code for the polynomials package supporting both term
list implementations.

# 2023-01-15 (Su)

Unfortunately, I got the representation of counted terms lists wrong, so my
multiplication didn't really work. Having fixed that, I also introduced a proper
sorting of the resulting terms list, and I moved more procedures (`prepend`,
`combine`) into my `functools` package. Now it's time for the second part of the
exercise: implementing the operations for the counted representations, for which
I got most of the procedures ready.

The third part would be to re-engineer the algebraic package to use both term
lists implementations.

# 2023-01-14 (Sa)

After some issues to get started, I implemented the higher-order functions
`reduce` and `partition`, which the I used to simplify the term list by
addition, which I still need to integrate.

# 2023-01-13 (Fr)

I implemented the multiplication of counted term lists, which was rather easy to
do. However, the result is not satisfying yet, because products with the same
exponent aren't added up yet. I should approach this as the next task.

# 2023-01-12 (Th)

I tried to figure out how to multiply ordered representations of term lists, but
gave up on it. The problem is not the multiplication process itself, but the
interpretation of its result. So I'm going to implement it for counted
representations only, which is then used for ordered representations using a
coercion.

# 2023-01-11 (We)

I continued working on exercise 2.90 in the train. I implemented the `=zero?`
predicate for ordered term lists, and used it to simplify the addition
implementation. I also started with the multiplication, but the train ride was
to short to get deep into it.

# 2023-01-10 (Tu)

I continued working on exercise 2.90, for which I managed to complete the
addition of ordered terms lists. Next up: multiplication.

# 2023-01-09 (Mo)

I started with the major exercise 2.90, for which I already have a plan.
Implementing the addition/multiplication procedures for different
representations, however, will be quite hard.

# 2023-01-08 (Su)

I worked through exercise 2.89, which is exactly the kind of work that keeps me
going in SICP. Those kinds of exercises provide a good mix of rather general
higher-order functions (such as `zip` and `enumerate`; however, with slight
adjustments) and recursive thinking.

# 2023-01-07 (Sa)

After some problems with untagged and tagged data, I was able to implement
exercise 2.88 using a `negate` procedure.

# 2023-01-06 (Fr)

I'm back on track after having finished exercise 2.87. I incorporated the code
into the polynomials example, which now works (having written some procedures
for plain numbers that do not expect them to be tagged as `'scheme-number`).

# 2023-01-05 (Th)

The symbolic algebra example starts to annoy me, because there's not a single
example of how the system is supposed to be used. Instead, I have to figure out
the data structures to be used by walking through five layers of procedures. One
single line of example code could have fixed that.

When I almost wanted to abandon chapter 2, I did one more thorough code check.
Using `apply-generic`, I'm now able to call the example code. However, it fails
exactly where exercise 2.87 picks up. So I'll give the entire thing one more
chance.

# 2023-01-04 (We)

I re-read the section on symbolic algebra and started writing down the example
code. I still don't understand the code, but I hope that the exercises will
enlighten me.

# 2023-01-03 (Tu)

I gave the section on the symbolic algebra example a first read. I'll go over it
in more detail tomorrow, and let the problem sink in until then.

# 2023-01-02 (Mo)

For exercise 2.86, I implemented the real part for different types (integer,
reational, and real). I re-implemented the type coercions and equality
operations on those types as an exercise. The only operation I implemented for
complex numbers was the equality check; and I only implemented it for
real/imaginary representations of complex numbers, not for magnitude/angle
representations.

Now I hope that I'm done with complex numbers and their various implementations
for the moment; the whole thing got quite convoluted over time.

# 2023-01-01 (Su)

I started the year by finishing exercise 2.85. All the work of the last two days
has finally paid off, and the implementation of `drop` fell in place almost
immeadiately. Having fixed a small arity mismatch in a coercion procedure,
everything worked as intended.

Exercise 2.85 was a tough one.

However, I sometimes doubted my bottom-up approach. How can I be sure that the
procedures I'm writing are really needed to solve the bigger problem? Maybe I
should layout the rough algorithm of an exercise at the beginning, especially
because the problem is clearly stated.

# 2022-12-31 (Sa)

I continued to work on exercise 2.85. I had some issues with the projection
procedures, but only because I didn't properly test the `raise` procedure from
exercise 2.83. Having fixed (and properly tested) that, I was able to finish the
projections. Next up: implementing the `drop` procedure, which will have to wait
for 2023.

That was 2022 from the SICP perspective. I started on July 30th and did not miss
a single day. The end of chapter 2 is very demanding, but I didn't quit. And I
wrote quite some Scheme code:

    $ find ~/github.com/patrickbucher/sicp/ -type f -name '*.scm' \
        -exec wc -l {} \; \
        | awk '{ sloc += $1; } END { print sloc }'
    6578

A lot of it is from the book, and some of it copied from earlier examples. But I
literally wrote thousands of lines of Scheme code, and learned a lot doing so.

I'm on page 201 now, so 200 pages in five months is 40 pages per month. 409
pages are left, so I should be able to finish SICP in 2023. Let's bring it on!

# 2022-12-30 (Fr)

I started with exercise 2.85, which is quite involved and big. Having laid out
the biggest part of the scaffolding, I let the task sink in until I continue to
work on it.

# 2022-12-29 (Th)

Once again, I had a day without any plans at my disposal, so I was able to
work on exercise 2.84 without any pressure. I was able to solve it after some
struggles with old state lurking around in the op/type table, which thought me
about the perils of changing state in an uncontrolled manner.

# 2022-12-28 (We)

I started with exercise 2.84, which looked very demanding at the beginning.
However, having de-composed the steps to raise the values to a common type, the
task looked way easier than at the beginning.

# 2022-12-27 (Tu)

I figured out the issue with exercise 2.83: I used proper lists for the example
instead of a pair. Having fixed that, the coercions work now.

# 2022-12-26 (Mo)

I continued to work on exercise 2.83 on the train, but got the structure wrong;
so I need to double-check my implementation.

# 2022-12-25 (Su)

I started exercise 2.83, but wasn't able to finish it yet due to Christmas duties.

# 2022-12-24 (Sa)

I finished exercise 2.82 by defining an example showing the shortcomings of the
approach, which is enough for Christmas Evening.

# 2022-12-23 (Fr)

After some initial struggles, I managed to get an example for exercise 2.82
running. However, I had to extend the coercion table implementation so that an
identity function is returned if the source and destination type are equal.

I yet have to write a more sophisticated example, using more than two arguments.

# 2022-12-22 (Th)

I worked on exercise 2.82, and the solution looks promising; however, testing it
requires a lot of more work, which I intend to do later.

# 2022-12-21 (We)

I started exercise 2.82 at home and continued working on it on the train.
(Fortunately, the `geiser-mit` package is quite a small download, affordable
over a mobile hot spot.) However, I wasn't able to finish the exercise yet.

# 2022-12-20 (Tu)

I made a few working examples for the new `apply-generic` supporting coercions,
and also worked through exercise 2.81; however, without proper testing (but I
get the point).

# 2022-12-19 (Mo)

I typed in the new `apply-generic` procedure with support for coercion.

# 2022-12-18 (Su)

I read the section about coercion and type hierarchies, and learned a lot about
the inadequacies of object-oriented type hierarchies based on inheritance.

I implemented the coercion table using the higher-level `filter` procedure.

# 2022-12-17 (Sa)

I managed to do exercises 2.77 to 2.80 rather quickly. However, I didn't
intergrate the change to the `'scheme-number` type into the existing example,
but implemented it in isolation, for I don't want to fiddle with something that
now works quite well.

# 2022-12-16 (Fr)

I figured out the issue with complex numbers in the generic math package; there
were dispatch procedures missing. This was also an issue 2.77, which I had to
shortcut. (The root issue is that the `put`/`get` operations to be used never
have been defined properly; so it's a lot of guess work. Unfortunately, I have
to drag some of those issue to the end of the chapter. But here, I decided to
leave exercise 2.77 unfinished in order to get going.)

# 2022-12-15 (Th)

I manage to fix the issue with `apply-generic`. One internal procedure used
lists instead of pairs, so it worked when I (gently) tested it directly, but not
when it was used by the generic dispatcher procedures.

# 2022-12-14 (We)

I worked on the generic arithmetic example, but it doesn't work yet. There's an
issue with the `apply-generic` procedure that I need to figure out.

# 2022-12-13 (Tu)

I started reading the section a bout systems with generic operations. I have to
re-visit the `put`/`get` table operations, as well as `apply-generic`, so that I
can implement everything needed.

I extended the op/type table as needed, and also put the `apply-generic`
procedure into the same file, which I now know how to use properly.

# 2022-12-12 (Mo)

I worked through the message passing example and then did exercises 2.75 and
2.76, which were rather easy and straightforward.

# 2022-12-11 (Su)

I only found some time to finish exercise 2.74 in the afternoon. I read the
following section on message passing, but then called it a day.

# 2022-12-10 (Sa)

I worked through part 1 and 2 of exercise 2.74. Due to some silly mistakes, I
lost a lot of time. But the task itself is not too difficoult.

# 2022-12-09 (Fr)

After a night of heavy headaches and a day full of teaching, I only managed to
start with exercise 2.74 in the evening. I defined the structure for both files
and records, but only have written the boiler-plate code for the actual
`get-record` procedure.

# 2022-12-08 (Th)

Finally a day off, and finally some progress: I finished exercise 2.73 after
some struggles. The problem was that I had wrong representations of the data in
my head. Once I got those straight, the exercise was rather easy and
straightforward. I leave exercise 2.74 for later or tomorrow.

# 2022-12-07 (We)

I got the example with the rectangular and polar implementations of complex
numbers with generic procedures to run. However, I had to simplify the code, so
that only a single tag is use in the operations table, instead of a list of
tags. _Now_ I'm ready for exercise 2.73.

# 2022-12-06 (Tu)

I modified the table implementation (`put`/`get`) so that it works with a global
`table` variable, which is modified using `set!`. Like this, I can use the exact
code from the book for exercise 2.73, which has to wait a bit longer.

However, I figured out how to load code from other files, and, quite
surprisingly, the main directory of the Git repo is used as the base code lookup
path. Now I do not longer need to resort to copy&paste, but can include my
existing code.

# 2022-12-05 (Mo)

I implemented the example code that installs two separate versions of complex
number implementations. I'll continue with exercise 2.73 (part 2) later.

# 2022-12-04 (Su)

I implemented a table (map, dictionary, associative array, whatever) with `put`
and `get` operation. The implementation is based on a list, and therefore is
rather slow, with O(n) complexity both for insertion and lookup. But that's
enough to revisit the examples from the current chapter, which I'll do tomorrow.

# 2022-12-03 (Sa)

I started reading the section on data-directed programming and additivity. The
concept absolutely makes sense to me, and combines two of my favourite concepts:
orthogonality and tables (i.e. maps).

However, since `put` and `get` (which are map accessors, I guess) aren't
introduced until chapter 3, I cannot really work with the examples. So I stopped
in the middle of exercise 2.73, and I'll try to implement my own version. (Not
efficiently as a tree, but at least so that I can test my code with it.)

# 2022-12-02 (Fr)

The usage of the `atan` function with _two_ arguments irritated me. Now I
figured out, that it can be used in two ways: with a single argument or with two
arguments:

    > (atan 3 4)
    .6435011087932844
    > (atan (/ 3 4))
    .6435011087932844

Now that I get the math behind the example, I can continue with the code.

I typed in the code with the tagged types procedures and tried it out, which
concludes this sub-section.

# 2022-12-01 (Th)

I reviewed complex numbers in a math textbook. Then I read the next section on
tagged types.

# 2022-11-30 (We)

I started reading the section on different representations for the same data.
The notions of "horizontal abstraction barries" (the barrier between high-level
operations and internal representations) and "vertical abstraction barriers"
(multiple internal representations) are introduced. Operations working on
multiple representations are called "generic" operations.

I typed in the examples for the two representations of complex numbers. But I
first need to study the subject before continuing with the examples.

# 2022-11-29 (Tu)

I answered the questions that remained for exercise 2.70. The remaining two
questions that remain for the Huffman encoding are rather theoretical. For
exercise 2.71, I created two trees for n=5 and n=10, and answered the question.
For exercise 2.72, I answered the question roughly.

# 2022-11-28 (Mo)

I worked through exercise 2.70 by combining the code of 2.68 and 2.69, but I had
to do some small adjustments. I made a mistake when entering the text to be
encoded, which then caused an error I could not track down. (The symbol could
not be encoded, of course.) I improved error handling by adding a corresponding
symbol to the list, so that it's clear from the result what went wrong.

# 2022-11-27 (Su)

I managed to get exercise 2.69 done. However, I slightly modified the data
structures, so that both a leaf and an inner node can be used the same way in
terms of weight and symbol access. I always keep the nodes sorted for the
successive merge, so that I can always take the first two. For this purpose, I
re-use the procedure to get the initial sorted set.

The Huffman tree generated looks good to me.

# 2022-11-26 (Sa)

I started with exercise 2.69. As the first step, the symbol/weight pairs needs
to be put in order, which is a bit more challanging than I first thought.

# 2022-11-25 (Fr)

I only managed to work on exercise 2.68 in the evening. The tree traversal
wasn't too hard. I made a mistake to compare the symbols using `=` instead of
`eq?`, but otherwise, it worked after the first try. Next up: building up the
huffman encoding tree, which I leave for tomorrow.

# 2022-11-24 (Th)

I implemented the Huffman tree example and worked through exercise 2.67, which
was very easy. I started implementing Huffman encoding in Go yesterday, but only
had little time to do so.

# 2022-11-23 (We)

I started reading the section about Huffman encoding. Before I start with the
implementation part, I'd like to approach the problem in another programming
language, e.g. Go or Python, to fully understand it.

# 2022-11-22 (Tu)

I started with exercise 2.66 in the morning by implementing the whole tree
structure from scratch.

I managed to build up the tree structure (storing employees from the Dilbert
universe); then the lookup was the much easier task.

# 2022-11-21 (Mo)

I noticed that I already had all the procedures in place in order to implement
the intersection procedure. The results of the two sub-trees can easily be
merged using append, because their values are guaranteed to be unique.

In the evening, I figured out that my `tree-contains?` procedure unneccessarily
searched through the whole tree, where it could just descend into one of the two
branches based on whether or not the searched value is smaller or bigger than
the current node's value. This reduced the complexity from `O(n)` to `O(log n)`
for the lookup. The intersection algorithm is now of complexity `O(n * log m)`,
where `n` is the size of the first tree, and `m` the size of the second one.

Later on, I also implemented the `union-set` procedure. Working with two
structurally similar data structure at the same time is rather messy, compared
to working with a single data structure.

# 2022-11-20 (Su)

I started working on exercise 2.65. I found an approach, but am not ready to
implement it yet. The idea is to traverse the first tree, and to extend the set
if the current element is contained in the second tree. However, I don't know
how to collect those entries by the means of recursion. (Each step creates new
partial solutions, which need to be integrated into the solution set.)

# 2022-11-19 (Sa)

I once more stepped through the algorithm to convert a sorted list of elements
into a tree. I already thought about how to implement intersection and union
using a tree, but haven't found a solution yet (exercise 2.65, that is).

# 2022-11-18 (Fr)

I wrote down and clarified my notes on exercise 2.64. Then I've drawn the tree
for the list `(1 3 5 7 9 11)` using GraphViz.

I gathered the code for exercise 2.65 from the exercises before.

# 2022-11-17 (Th)

I started analyzing the list to tree conversion algorithm on paper, which
clarified things up for me. The nested `let` bindings make everything a bit
harder to read. Here, Clojure offers a much nicer syntax. I still need to play
around with the example and draw the tree thus built, but I roughly get the idea
behind the algorithm.

# 2022-11-16 (We)

I only managed to type in the code of exercise 2.64 in the evening. I quickly
tested it; more to come tomorrow.

# 2022-11-15 (Tu)

I concluded that the two procedures in exercise 2.63 have the same growth when
working through a (balanced) tree.

# 2022-11-14 (Mo)

I started analyzing the two procedures for exercise 2.63 (recursive and
iterative) to convert trees to lists, but haven't concluded yet if any of the
two is more efficient. I guess that both require the same amount of step,
because the shape and size of the data structure determines the number of steps.

# 2022-11-13 (Su)

In the morning, I started to re-read the section on sets as binary trees, which
I had to abandon due to more urgent tasks at hand.

I only managed to start with exercise 2.63 late in the evening. I typed in the
two implementations, but was not able anymore to reason about the two different
approaches, which I save up for tomorrow.

# 2022-11-12 (Sa)

I read about sets represented as binary trees and implemented the example.

# 2022-11-11 (Fr)

First, I fixed the `adjoin-set` procedure of exercise 2.61, which consisted just
of handling another condition. Second, I implemented `union-set` using the
`adjoin-set` procedure. I'm not sure if the implementation has the order O(n),
but either the first or second set shrinks with every iteration.

# 2022-11-10 (Th)

I started with exercise 2.62 and thought about different approaches. As I wanted
to re-use the `adjoin-set` procedure from yesterday, I realized that it cannot
properly handle duplicates. So I need to go back to that one first.

# 2022-11-09 (We)

I read the section about sets represented as ordered lists, worked through the
example code, and did exercise 2.61, which was rather straightforward using an
iterative approach.

# 2022-11-08 (Tu)

I worked through exercise 2.60, in which the internal set representation is
allowed to store duplicates. The union and intersection implementation therefore
need to check for duplicates when building up the result set. This additional
step is straightforward when working with an iterative rather than a recursive
implementation.

# 2022-11-07 (Mo)

I read about the set representation, worked through the example code, and
implemented the union procedure for two sets in exercise 2.59.

# 2022-11-06 (Su)

For exercise 2.58, I wrote some kind of simple parser that converts infix
notation to prefix notation for sums and products. I skip on the second part,
but keep the problem in mind.

# 2022-11-05 (Sa)

I got to work on exercise 2.57 only in the afternoon. I wasn't able to figure
out a way to implement the multi-arity expressions without touching the original
`deriv` procedure, so I solved the problem in isolation.

# 2022-11-04 (Fr)

Exercise 2.56 was rather easy, and I remembered the derivation rule to be
implemented as one of the most basics one I used on a daily basis during math
classes twelve years ago. For the implementation, I've also written a `pow`
procedure, which even can deal with negative exponents. The extended `deriv`
procedure worked the first time I tested it.

Symbolic computation is a very interesting concept. When I remember solving
equations in Python using some special library for the purpose, I would not want
to go back, but stick to Scheme, which has support for symbols built in natively
to the language.

# 2022-11-03 (Th)

I worked through the improvements of the derivatives example and checked them
against my manual calculations from yesterday. I had a glance at 2.56, but need
some more thinking time before tackling it.

# 2022-11-02 (We)

I started with implementing the derivative procedure with all its required
procedures representing and working with the data structures. Now I'll revisit
differentiation from a math perspective by computing the examples on my own
before I start working on the exercises.

I worked through the three sample calculations and checked them on WolframAlpha.
Now I'm confident that I understand the basics.

# 2022-11-01 (Tu)

Today was a very unproductive day in terms of SICP. I only started reading the
next section with examples on differentiation using symbols. I need to pick up
the pace tomorrow! Today was a public holiday, after all, so I shouldn't feel
too bad about it…

# 2022-10-31 (Mo)

I started reading the section on symbolic data. With some of it I already was
familiar. Exercise 2.53, however, demonstrated that I didn't fully understand it
yet. But I managed to work through it nonetheless, as well as exercises 2.54 and
2.55. Finally some early-morning progress again…

# 2022-10-30 (Su)

I finished section 2.2 by working through exercise 2.52, which was rather a
demonstration than a serious challenge. But it made the point put forward in the
text.

This section was a temptation to quit, but once I got my environment together
with Racket, I really could follow through with properly testing my code. I now
better understand higher-order functions in terms of procedures that return
other procedures.

I'm glad that I followed through; and since today is October 30th, it is three
months ago that I choose to seriously work through SICP, at least through the
first two or three chapters. There's still a lot ahead in chapter 2, which
probably will take up the rest of the year, given the little time I'm able to
spend on it.

# 2022-10-29 (Sa)

Finally I found some time to do my exercises properly. I sat down for exercises
2.50 and 2.51, which were quite enlightening. I finally understand the
difference of a frame and a painter. The painter itself is a procedure to be
called with the frame as an argument.

"The most useful thing a function can return is another function.", I once
heard, probably in an interview Gerald Jay Sussman concerning the SICP follow-up
book _Software Desing for Flexibility_. I now understand what he meant.

Yesterday, I also figured out what was wrong with my Emacs/Geiser/Racket setup:
nothing! I just had a syntax error in my code. Now I can also use Emacs for
Racket programming, but I have to leave away the `#lang sicp` declaration for
some reason.

# 2022-10-28 (Fr)

I worked through exercise 2.49, which was a bit irritating at the beginning,
until I figured out that `sicp-pict` defines all the procedures needed to
perform the task.

I managed to draw shapes quite fast; only the `wave` figure turned out a bit
corny and rather looks like a skiapode than a human.

# 2022-10-27 (Th)

Today I only managed to do exercise 2.48, which was easy, in the morning.

# 2022-10-26 (We)

I worked through exercise 2.47 using DrRacket. Unfortunately, my setup based on
Emacs, Geiser, and Racket is still not properly working.

Yesterday, I finished my first implementation of the SuperLeague stock program
using Racket. I'll have to figure out the difference between `accumulate` and
`reduce` (the ones I've implemented on my own). I thought that they do the same,
which is not the case.

# 2022-10-25 (Tu)

I'm back on track and finally managed to do an exercise in the early morning:
exercise 2.46 about vectors. However, my Emacs/Geiser/Racket setup still isn't
working properly. And DrRacket is not the editor I'd like to work with on a
daily basis.

Yesterday, I also started implementing my
[SuperLeague](https://github.com/patrickbucher/superleague-polyglot) stock
program in Racket. For this, I'm using Visual Studio Code. But Vim would be just
as good, I think, for I haven't figured out yet how to interact with the REPL in
VSCode.

# 2022-10-24 (Mo)

I managed to output pictures with an arbitrary resolution in DrRacket. This,
however, was not a configuration issue, but a set of parameters to the
`paint` procedure I didn't know. I also have to double-check on the Racket
syntax of keywords, which are used for that purpose.

I played around with a few more examples and managed to work through exercise
2.45.

# 2022-10-23 (Su)

Even though I got together a somewhat working Racket setup with Emacs and
Geiser, I still have some [issues](https://stackoverflow.com/q/74169756/6763074)
with evaluating Racket expressions.

Instead of wasting more time with this setup, I switched over to DrRacket. Now I
was able to properly execute the examples. I also worked through the easy
exercise 2.44. At least, I'm back on track now…

# 2022-10-22 (Sa)

I decided to not just do the exercises on the picture language without properly
testing them, i.e. with a verifyable graphical output. For this, I'm going to
switch to Racket for the next couple of exercises, and I'll document what is
needed for the Racket setup in this repo. Not exactly SICP, but I'll probably be
using a Racket package called `sicp` for this purpose, so close enough…

After some struggles, I managed to get my setup based on Racket, Emacs, and
Geiser running. So tomorrow I can start digging in with the picture language
examples and exercises.

# 2022-10-21 (Fr)

I started reading section 2.2.4 about the picture language. I wonder how I'm
going to test my solutions to the exercises, as no implementation for actually
drawing the pictures is provided. (Maybe I need to try Racket for this
particular task.)

# 2022-10-20 (Th)

I didn't get to work on exercise 2.43 before late in the evening, but figured
out the differences quite quickly. I didn't perform a detailed mathematical
analysis on the runtime difference, but my hunch that the modified `queen-cols`
is exponentially slower as the original one against some sample turned out to be
true when checking against some sample solution.

I won't work through the tasks to analyse the runtime complexity of procedures
as thoroughly as through the programming exercises and leave this to another
time and book project (Introduction to Algorithms, 4th Edition).

# 2022-10-19 (We)

Today I was still recovering from a cold, so I only read about the 8 Queens
Puzzle. Later on, I once again worked through the `flatmap` example as a
preparation for the 8 Queens Puzzle. I started with exercise 2.42, but struggled
to figure out what kind of representation to use. After my approach to just use
lists of row indices (the column index is the position in the list) failed, I
glanced at a solution that uses row/col pairs for the positions. So I'll try
this approach tomorrow.

I quickly returned into the code to write some building blocks (are two
positions in the same row, column, diagonal?); then I finished the exercise.
However, calling `(queens 8)` blows the stack. But the solution to `(queens 3)`
looks sensible.

# 2022-10-18 (Tu)

Having been sick the whole day, I only did exercise 2.41 in the evening. I
figured out that triple-nested enumerations require two calls to `flatmap` for
proper unwrapping. However, the reason isn't yet intuitively clear to me.

# 2022-10-17 (Mo)

I worked through exercise 2.40, which gave me the chance to repeat some
techniques from yesterday's example.

# 2022-10-16 (Su)

I worked through the examples of the "Nested Mappings" section and
re-implemented some procedures from earlier in the book (e.g. prime test). I
heard of `flatmap` before when reading about monads; now it showed up in this
different context, for a different purpose.

# 2022-10-15 (Sa)

I worked through exercise 2.39, which was about reversing lists using
`fold-left` and `fold-right`. The `fold-left` implementation was more "natural".
For the `fold-right` implementation, I defined a placeholder procedure `switch`
and wrote out the entire call stack, until it was just a sequence of `switch`
calls. Filling in the actual definition of `switch` was then very easy. I guess
this is what Dijkstra meant by "reasoning with uninterpreted symbols". This
allowed me to unwrap the whole problem before tackling the solution to it.

# 2022-10-14 (Fr)

I worked through exercise 2.38, which was rather easy after yesterday's
preparation work for it. The property `(= (op a b) (op b a))` is called
_commutative law_, which I forgot and had to search.

# 2022-10-13 (Th)

Before tackling exercise 2.38, I wanted to re-implement `accumulate` both
recursively and iteratively to experiment with the differences. The recursive
approach (a.k.a. `fold-right`) works fine for `cons`ing together two lists. The
iterative approach (a.k.a. `fold-left`) works fine with the `exp` procedure
(chained exponentiation). The two procedures produce the same output, if the
given operation produces the same result with changed parameter order: `(= (op a
b) (op b a))`.

# 2022-10-12 (We)

I was able to finish exercise 2.37 after a short peek into the proper solution
to `matrix-*-vector`. I did it the right way all along, but tested it the wrong
way, i.e. I expected a different result than the correct one that was returned
already.

# 2022-10-11 (Tu)

I started with exercise 2.37, which was quite some struggle so far. So far, I
was unable to implement the `matrix-*-vector` procedure, which is given using a
call to `map` on the top-level. However, I changed the structure by wrapping the
given `map` call using an `accumulate-n` call, which does work. I'll re-visit
this part of the exercise once I'm done with the rest.

# 2022-10-10 (Mo)

I worked through exercises 2.35 and 2.36. Even though I have been using
higher-order procedures like `map` and `reduce` for a long time, I obviously
haven't realized the full power of them, because using them does not
automatically did not come to my mind at the very start, especially in exercise
2.36. (In exercise 2.35, the use of `map` was already given.)

I wonder if every algorithm can be implemented by the means of `enumerate`,
`filter`, `map`, `accumulate` (or `reduce`, respectively).

I once again thought about my failed attempt to implement `accumulate` using
tail-call optimization the last week. When I tested the procedure using
additions and multiplications, everything worked fine. But once I tried to use
it with `cons`, the result was totally different from the recursive
implementation. Last night I realized the issue: the order of operators does
matter for `cons`, but not for `+` or `*`. I remembered my short Haskell
interlude in the summer of 2020, where `foldl` and `foldr` have been introduced.
Now I guess that I have implemented my tail-call optimized `accumulate` as
`foldr`, but I needed `foldl`. I'll pick up on that later.

# 2022-10-09 (Su)

I worked through exercise 2.34; first on paper, then I re-implemented
`accumulate` recursively, just to get out of the procedural mindset. Revisiting
`accumulate` also helped me to figure out the lambda expression for the Horner
evaluation. (The second parameter, `higher-terms`, could have been named better,
in my opinion—as a singular, that is.)

# 2022-10-08 (Sa)

After some struggle, I managed to finish exercise 2.33. The main issue was that
I provided my own whacky implementation of `accumulate` instead of re-using the
one provided in the chapter. This made things hard, if not impossible.

Once I switched to the provided `accumulate` implementation, the pieces fell
into place, and the exercise was easy to finish.

I absolutely need to get rid of my habit to implement procedures using tail-call
optimization from the start. This just makes everything harder.

# 2022-10-07 (Fr)

I took up the examples on conventional interfaces again and started with
exercise 2.33, which needs a bit more thinking.

# 2022-10-06 (Th)

With some headache, I worked through some examples (`accumulate`, `enumerate`).
I'll continue in the evening.

# 2022-10-05 (We)

After not having missed moving day, I worked through the examples of the next
section and read on. There term "transducers" is introduced, which I already
heard in the Clojure community. I already used `filter` and `map` a lot and
even have implemented them, but never with `cons`. What I knew as a `reduce`
function is called `accumulate` in SICP, which is probably the better term for
what is accomplished.

# 2022-10-04 (Tu)

Today's moving day. However, I managed to solve exercise 2.32. Sleeping over it
again was a good idea (even though I didn't get that much sleep). That's all
for today.

# 2022-10-03 (Mo)

I worked through the tree map example, as well as through exercises 2.30 and
2.31. Exercise 2.32 is a bit more tricky, so I left it as unfinished business,
to think about during the day.

# 2022-10-02 (Su)

I worked through exercise 2.29, which was quite a lot of work. My main issue was
that two different kinds of data structures are involved: mobiles and branches.
And I mixed those up in my implementation, which is one of the perils of
programming without types.

Part d) of the exercise was quite enlightening. I also was able to simplify the
main procedures of exercises b) and c) after switching from `(not (list? ...))`
and `(not (pair? ...))` to the `(number? ...)` predicate. I should have defined
that one with the access procedures from the very start.

# 2022-10-01 (Sa)

I started with exercise 2.28 about tree processing, and first got confused,
because I already anticipated an iterative solution using an accumulator. As
I resorted to the recursive approach, the procedure worked on first try. A
recursive approach is way more "natural" for a recursive structure like a tree
than an iterative one!

I refactored the function and called it a day.

# 2022-09-30 (Fr)

I worked through exercise 2.27, which wasn't as hard as I first thought. Having
re-implemented `reverse` instead of just copying the code probably helped as a
warmup exercise.

This concludes the second month of SICP. I haven't missed a single day. I
probably will miss my moving day the next week: the 4th of October. But let's
see…

# 2022-09-29 (Th)

I worked through exercise 2.25, which was a bit harder (and more cumbersome)
than it initially looked like. I tried to limit the function cals to `car` and
`cdr` with combinations thereof, e.g. `cadadr`.

I also got to know the `append` function in exercise 2.26 and was a bit puzzled
with the difference between `cons`/`list` at first, but then figured it out.

# 2022-09-28 (We)

I worked through the `count-leaves` example and struggled to figure out the
right `cons` structure for exercise 2.24. Once I figured it out, I created two
graphs using Graphviz, which I haven't been using for quite a long time. It
proofed to be the right tool for the job, and I learned some new things (e.g.
how to optically connect a node to a cluster).

# 2022-09-27 (Tu)

I worked through exercises 2.21, 2.22, and 2.23, which were rather easy. I was
glad to see that my issue with the order of the result of an iterative procedure
really is an issue in exercise 2.22.

# 2022-09-26 (Mo)

I worked through exercise 2.20, which was fairly easy to implement. However, my
implementation didn't work, because I implemented the `odd?` and `even?`
predicates the wrong way; using division instead of the `remanider` procedure,
that is. When I thought that I was finished, I had to reverse the resulting
list, for which I wrote an iterative procedure, once again.

Having read the next section on the `map` procedure, I realized that recursive
procedures do not require reversing the result in order to keep the original
order of items.

# 2022-09-25 (Su)

I worked through exercise 2.19, which was surprisingly easy and only required
the use of `car`, `cdr`, and `null?`. It was also surprising to me that the
order of the given coins does not matter. I quickly implemented a `reverse`
procedure for more convenient testing.

# 2022-09-24 (Sa)

I started reading the section on lists in the morning, but didn't do any
examples or exercises.

I started over in the evening and typed in some examples. I figured out that
`nil` is no longer define in MIT-Scheme; one has to use `'()` instead. (A
footnote a couple of pages later makes the case for using `'()`.)

After working through the examples, I finished two rather simple exercises.
Reversing a list I already did in Prolog a couple of years ago.

# 2022-09-23 (Fr)

I finished exercise 2.14, for which I implemented both multiplication and
division. Since multiplication uses the same brute-force technique as
subtraction, I implemented a common procedure that also accepts an operator.

I also wrote some comments on exercises 2.15 and 2.16. However, I didn't spend a
lot of time on exercise 2.16, which clearly is rather a task for mathematicians.

# 2022-09-22 (Th)

I worked through the examples demonstrating different results in interval
arithmetics when using two different but equivalent formulas. Then I started
with exercise 2.14, but first tried out addition and subtraction before doing
the multiplication and division, as asked by the exercise. I wanted to
re-implement the whole arithmetics using percentages from scratch before.

# 2022-09-21 (We)

In the morning, I figured out what I did wrong with my calculation. I found
another solution that looked much saner to me. I entered my calculations into a
LaTeX document and thereby used the `alignat` environment for the first time.

I also implemented the computation in Scheme, which worked quite well after
fixing some "off by the factor of 100" error (I mixed up percentages and
ratios).

# 2022-09-20 (Tu)

I worked on exercise 2.13, for which I found a quite straightforward solution.
However, when typing in the formula with LaTeX, I found a mistake. The corrected
solution does not look convincing, so I have to double-check later on.

I figured out later, that I used absolute widths rather than percentage
intervals, so I performed the entire calculation again—and got exactly the same
formula to calculate the delta of the product.

# 2022-09-19 (Mo)

I read further on different representations of intervals and worked through
exercise 2.12, which was rather easy.

# 2022-09-18 (Su)

I implemented the remaining six of the nine cases and refactored the code.
Exercise 2.11 is done; however, zero values are not handled. Since this exercise
section is done, I'll start with the new section tomorrow.

# 2022-09-17 (Sa)

I worked through all the nine different cases for exercise 2.11 and figured out
how to compute the minimum and maximum values. The only case where brute force
is needed, is when both intervals span over zero (both lower negative, both
upper positive). The other eight cases can be computed directly by reasoning
about which boundry to use as the factors.

I implemented a brute-force method to check my implementation. Then I
implemented the first three cases; the rest I leave for tomorrow, for today's a
busy day!

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

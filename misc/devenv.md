# SICP Development Environment

## Setup

See the [setup instructions](https://github.com/patrickbucher/docs/blob/master/emacs/sicp-emacs.md) in my [docs](https://github.com/patrickbucher/docs/) repository.

## Usage

Open `emacs` with a new file (`demo.scm`):

    $ emacs demo.scm

Write a function:

```scheme
(define (increment x)
  (+ x 1))
```

Save the file:

    C-x C-s

Start the REPL:

    C-c C-z

Switch back to the code window (`demo.scm`):

    C-x o

Evaluate the entire buffer:

    C-c C-b

Switch to the REPL window:

    C-c C-z

Call the `increment` function:

    > (increment 3)
    4

Switch batch to the code window (`C-x o`), and define another function:

```scheme
(define (increment x)
  (+ x 1))

(define (twice x)
  (* x 2))
```

Make sure the cursor is at the end of the new function definition, then evaluate
the definition to its left (`twice`):

    C-x C-e

Switch to the REPL (`C-c C-z`), and test the function:

    > (twice 7)
    14

## Geiser Cheat Sheet

This is an excerpt from the [Geiser cheat
sheet](https://www.nongnu.org/geiser/Cheat-sheet.html#Cheat-sheet), consisting
only of the key chords that I actually use.

| Key       | Description                                |
|-----------|--------------------------------------------|
| `C-c C-z` | Switch to or start the REPL                |
| `C-c C-b` | Evaluate the entire buffer                 |
| `C-x C-e` | Evaluate the expression left of the cursor |

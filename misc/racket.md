# Racket

Notes on Racket, mostly on what is needed in order to work through the picture
language exercises of section 2.2.4

As a start, `racket` is installed on Arch Linux:

    sudo pacman -S racket

## Package Management

Packaes can be found in the [Racket Package Catalog](https://pkgs.racket-lang.org/).

The `raco pkg` command (not the DrRacket GUI) is used here.

Show the installed packages:

    raco pkg show

Show the installed packages with their auto-installed dependencies:

    raco pkg show --all

Install a package by its name (here: [`sicp`](https://pkgs.racket-lang.org/package/sicp),
to be found on the Package Catalog):

    raco pkg install sicp

Install, but do not prompt whether or not to install dependencies:

    raco pkg install --deps search-auto --batch sicp

Update an installed packages:

    raco pkg update sicp

Update all installed packages:

    raco pkg update --all

Remove (uninstall) a package:

    raco pkg remove sicp

## Emacs

Use `melpa` instaed of `melpa-stable` (`~/emacs`):

    (require 'package)
    (add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
    (package-initialize)

Refresh the packages after re-opening Emacs:

    M-x package-refresh-contents

Install `racket-mode`:

    M-x package-install RET racket-mode

Install the package `geiser-racket`:

    M-x package-install RET geiser-racket

Extend your Geiser config (`~/emacs`):

    (setq geiser-mit-binary "/usr/bin/scheme")
    (setq geiser-racket-binary "/usr/bin/racket")
    (setq geiser-active-implementations '(mit racket))
    (add-to-list 'auto-mode-alist '("\\.rkt\\'" . geiser-mode))

Start using the picture language (example code: `../examples/einstein.rkt`):

    #lang sicp
    (#%require sicp-pict)
    (paint einstein)

Open it in Emacs:

    emacs ../examples/einstein.rkt

Start a Racket REPL and evaluate the whole buffer:

    C-c C-z
    C-x o
    C-c C-b

An image of Einstein should appear.


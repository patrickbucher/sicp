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


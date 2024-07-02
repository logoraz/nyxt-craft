# Nyxt Config

Nyxt [nýkst] is an infinitely extensible keyboard-driven web browser written in Common Lisp
and designed for hackers. Inspired by Emacs and Vim, it has familiar keybindings (Emacs, vi, CUA).
It also currently aims to implement an IDE/Text Editor that will surpass Emacs.

## Compiling from source

Fedora Installation for gi-gtk & nyxt-electron (using cl-electon)

- Install dependencies needed to compile:

```
  $ sudo dnf install sbcl webkit2gtk4.0-devel glib-networking gsettings-desktop-schemas \
                     libfixposix-devel xclip wl-clipboard enchant pkgconf npm
```
- Get source and compile:

```
  $ mkdir -p ~/common-lisp             
  $ git clone --recurse-submodules https://github.com/atlas-engineer/nyxt ~/common-lisp/nyxt
  $ cd ~/common-lisp/lem
  $ make NYXT_RENDERER="electron" all
```

- or to make with gi-gtk renderer:


```
  $ make all
```

## Config

My Nyxt config is setup in a modular fashion, separating different functionalities into their own files
as follows:

- config.lisp (main configuration scaffolding)
- theme.lisp (theme related code)
- passwords.lisp (configures the current password interface)
- utilities.lisp (piecewise coded utilities & commands - a WIP)







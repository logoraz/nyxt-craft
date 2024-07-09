# Nyxt Config

Nyxt [nýkst] is an infinitely extensible keyboard-driven web browser written in Common Lisp
and designed for hackers. Inspired by Emacs and Vim, it has familiar keybindings (Emacs, vi, CUA).
It also currently aims to implement an IDE/Text Editor that will surpass Emacs.

## Compiling from source

Fedora Installation for gi-gtk (& cl-electron)

- Install dependencies needed to compile:
  - See: https://github.com/atlas-engineer/nyxt/blob/master/documents/README.org#lisp-dependencies

```
  $ sudo dnf install sbcl webkit2gtk4.0-devel glib-networking gsettings-desktop-schemas \
                     libfixposix-devel xclip wl-clipboard enchant pkgconf \
                     redhat-rpm-config
```
- Get source and compile:

```
  $ mkdir -p ~/common-lisp             
  $ git clone --recurse-submodules https://github.com/atlas-engineer/nyxt ~/common-lisp/nyxt
  $ cd ~/common-lisp/nyxt
  $ make all
```

- Install dependencies needed for cl-electron (in addition to gi-gtk dependencies above)


```
  $ sudo dnf intall npm
  $ make all NYXT_RENDERER="electron"
```

## Config

My Nyxt config is setup in a modular fashion, separating different functionalities into their own files
as follows:

- config.lisp (main configuration scaffolding)
- theme.lisp (theme related code)
- passwords.lisp (configures the current password interface)
- passwords-dev.lisp (WIP - Implemented to test solution to issue/bug report #3431)
- utilities.lisp (piecewise coded utilities & commands - a WIP)







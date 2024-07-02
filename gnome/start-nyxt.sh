#!/bin/sh

# Setup for GI-GTK Nyxt to look descent in Gnome (on Guix)

# Set title bar of GTK applications 
export GTK_THEME=Adwaita:dark

# Launch Nyxt in the background
/home/logoraz/common-lisp/nyxt/nyxt &

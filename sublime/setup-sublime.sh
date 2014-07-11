#!/bin/sh

# setup_sublime
DIR=~/Library/Application\ Support/Sublime\ Text\ 3

# if user already has User package, back them up.
if [ -d "$DIR/Packages/User" ]; then
    echo "moving current (...Sublime Text)/Packages/User to (...Sublime Text)/Packages.bak/User"
    mkdir "$DIR/Packages.bak"
    mv "$DIR/Packages/User" "$DIR/Packages.bak/User"
fi

# create symbolic link from $DOTFILES to DIR
ln -s ~/dotfiles/sublime/User "$DIR/Packages/User"


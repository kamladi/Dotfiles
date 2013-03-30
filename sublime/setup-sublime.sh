#!/bin/sh

# setup_sublime
DIR=~/Library/Application\ Support/Sublime\ Text\ 2

# if user already has User package, back them up.
if [ -d "$DIR/Packages/User" ]; then
    echo "moving current (...Sublime Text 2)/Packages/User to (...Sublime Text 2)/Packages.bak/User"
    mkdir "$DIR/Packages.bak"
    mv "$DIR/Packages/User" "$DIR/Packages.bak/User"
fi

# create symbolic link from $DOTFILES to DIR
ln -s ~/dotfiles/sublime/User "$DIR/Packages/User"

# finally, add subl command to terminal path  if necessary
if[ ! -L /usr/bin/subl ]; then
	echo "adding sublime command to terminal path"
	ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/subl
fi

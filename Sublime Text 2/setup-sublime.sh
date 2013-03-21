#!/bin/sh

# setup_sublime

cd ${DOTFILES}/Sublime\ Text\ 2

# move settings folders to this folder
mv ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User .

# create symbolic links to new location of settings directories
cd ~/Library/Application\ Support/Sublime\ Text\ 2
$ ln -s ${DOTFILES}/Sublime\ Text\ 2/Packages/User ./Packages/User

# finally, add subl command to terminal path 
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/subl

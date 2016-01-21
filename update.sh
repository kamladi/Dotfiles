#!/bin/sh

DOTFILES=~/dotfiles

# Update vim plugins
cd $DOTFILES/.vim/bundle
for plugin in $(ls); do
    echo "\nUpdating $plugin"
    cd $plugin
    git pull
    cd ..
done

echo "\nUpdate complete."

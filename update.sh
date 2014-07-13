#!/bin/sh

DOTFILES=~/dotfiles

# Update oh-my-zsh
echo "Updating oh-my-zsh"
cd $DOTFILES/oh-my-zsh
git pull

# Update vim plugins
cd $DOTFILES/.vim/bundle
for plugin in $(ls); do
    echo "\nUpdating $plugin"
    cd $plugin
    git pull
    cd ..
done

echo "\nUpdate complete."

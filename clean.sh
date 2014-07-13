#!/bin/sh

. ./util.sh

e_header "Cleaning up..." 

files=( ".aliases" ".bashrc" ".bash_profile" ".vim" ".vimrc" ".zshrc" ".oh-my-zsh" )
for file in "${files[@]}"; do
    path="$HOME/$file"
    e_header "Removing $path" 
    rm $path
done

e_success "Cleanup complete." 


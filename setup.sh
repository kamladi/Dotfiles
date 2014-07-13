#!/bin/sh
DOTFILES=~/dotfiles
DOTFILES_OLD=~/dotfiles_old

. ./utils.sh

#
# Install GCC
#
# Before relying on Homebrew, check that packages can be compiled
if ! cmd_exists 'gcc'; then
    e_error "The XCode Command Line Tools must be installed first."
    printf "  Download them from: https://developer.apple.com/downloads\n"
    printf "  Then run this setup script again.\n"
    exit 1
fi


#
# Install Homebrew
#
# Check for Homebrew
if ! cmd_exists 'brew'; then
    e_header "Installing Homebrew..."
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

#install important brew packages
cat ./brew_packages | xargs -I pkg brew install pkg


#
# Install git
#
# Check for git
if ! cmd_exists 'git'; then
    e_header "Updating Homebrew..."
    brew update
    e_header "Installing Git..."
    brew install git
fi

#
# Install Oh-my-zsh
#
# Setup Oh-My-Zsh if it isn't already present
url="http://github.com/michaeljsmalley/oh-my-zsh.git"
if [[ -d ${DOTFILES}/oh-my-zsh/ ]]; then
    cd ${DOTFILES}/oh-my-zsh
    git pull
else
    git clone $url
fi


# Set the default shell to zsh if it isn't currently set to zsh
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
fi

# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory. The `bash_profile` sources other files directly from the
# `.dotfiles` repository.
e_header "Note: Existing dotfiles are moved to ~/dotfiles_old."
link ".bashrc"          ".bashrc"
link ".aliases"         ".aliases"
link ".bash_profile"    ".bash_profile"
link ".vim"             ".vim"
link ".vimrc"           ".vimrc"
link ".zshrc"           ".zshrc"
link "oh-my-zsh"        ".oh-my-zsh"

e_success "Dotfiles update complete!"
source ${HOME}/.zshrc

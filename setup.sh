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
confirm "Install homebrew packages?"
if is_confirmed; then
    cat ./brew_packages | xargs -I pkg brew install pkg
fi

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
# Install Prezto
#
url="https://github.com/sorin-ionescu/prezto"
if [[ ! -d $HOME/.zprezto ]]; then
    git clone --recursive $url ~/.zprezto
fi

# Set the default shell to zsh if it isn't currently set to zsh
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
fi

# symlink default prezto rc files
for rcfile in "zlogin" "zlogout" "zprofile" "zshenv" ; do      
    ln -s "${HOME}/.zprezto/runcoms/$rcfile" "${HOME}/.${rcfile:t}"
done

# Override symlinks with your our custom rc files
e_header "Note: Existing dotfiles are moved to ~/dotfiles_old."
link ".bashrc"          ".bashrc"
link ".aliases"         ".aliases"
link ".bash_profile"    ".bash_profile"
link ".vim"             ".vim"
link ".vimrc"           ".vimrc"
link ".zshrc"           ".zshrc"
link ".zpreztorc"      ".zpreztorc"

e_success "Dotfiles update complete! Restart your shell now..."


#!/bin/sh
DOTFILES=~/dotfiles
DOTFILES_OLD=~/dotfiles_old

#create backup dotfiles folder if it doesn't exist
if [[ ! -d $DOTFILES_OLD ]]; then
    mkdir $DOTFILES_OLD
fi

# Header logging
e_header() {
    printf "\n$(tput setaf 7)%s$(tput sgr0)\n" "$@"
}

# Success logging
e_success() {
    printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$@"
}

# Error logging
e_error() {
    printf "$(tput setaf 1)x %s$(tput sgr0)\n" "$@"
}

# Warning logging
e_warning() {
    printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
}

# Ask for confirmation before proceeding
seek_confirmation() {
    printf "\n"
    e_warning "$@"
    read -p "Continue? (y/n) " -n 1
    printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      return 0
    fi
    return 1
}

# Test whether a command exists
# $1 - cmd to test
type_exists() {
    if [ $(type -P $1) ]; then
      return 0
    fi
    return 1
}

link() {
    # Move existing dotfile to dotfiles_old directory
    if [[ -f ~/${2} ]]; then
        mv ~/${2} ${DOTFILES_OLD}/
    fi

    # Create new symlink.
    ln -s ${DOTFILES}/${1} ~/${2}
}

# Before relying on Homebrew, check that packages can be compiled
if ! type_exists 'gcc'; then
    e_error "The XCode Command Line Tools must be installed first."
    printf "  Download them from: https://developer.apple.com/downloads\n"
    printf "  Then run: bash ~/.dotfiles/bin/dotfiles\n"
    exit 1
fi


# Check for Homebrew
if ! type_exists 'brew'; then
    e_header "Installing Homebrew..."
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

    #install important brew packages
    brew install bash-completion wget mysql node redis lame mongodb sqlite tree zsh

fi


# Check for git
if ! type_exists 'git'; then
    e_header "Updating Homebrew..."
    brew update
    e_header "Installing Git..."
    brew install git
fi


# Setup Oh-My-Zsh if it isn't already present
if [[ ! -d $DOTFILES/oh-my-zsh/ ]]; then
    git clone http://github.com/michaeljsmalley/oh-my-zsh.git
    # Uncomment this line if you want to restart with a clean oh-my-zsh template
    # cp ${DOTFILES}/oh-my-zsh/templates/zshrc.zsh-template ${DOTFILES}/.zshrc
fi

# Set the default shell to zsh if it isn't currently set to zsh
if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
fi


# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory. The `bash_profile` sources other files directly from the
# `.dotfiles` repository.
e_header "Installing Homebrew..."
e_header "Note: Existing dotfiles are moved to ~/dotfiles_old."
link ".bashrc"          ".bashrc"
link ".aliases"         ".aliases"
link ".bash_profile"    ".bash_profile"
link ".vim"             ".vim"
link ".vimrc"           ".vimrc"
#link ".gemrc"          ".gemrc"
#link ".rvmrc"          ".rvmrc"
link ".zshrc"           ".zshrc"
link "oh-my-zsh"        ".oh-my-zsh"

e_success "Dotfiles update complete!"
source ${HOME}/.bash_profile
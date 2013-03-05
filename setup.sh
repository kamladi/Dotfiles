#!/bin/sh
DOTFILES=${HOME}/dotfiles


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
    # Force create/replace the symlink.
    ln -fs "${DOTFILES}/${1}" "${HOME}/${2}"
}

# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory. The `bash_profile` sources other files directly from the
# `.dotfiles` repository.
mirrorfiles() {
	link "bash/.bashrc"			".bashrc"
	link "bash/.bash_aliases"	".bash_aliases"
	link "bash/.bash_profile"	".bash_profile"
	link "vim/"					".vim"
	#link "gemrc"				".gemrc"
	#link "rvmrc"				".rvmrc"
	link "zsh/.zshrc"			".zshrc"

	e_success "Dotfiles update complete!"
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
fi


# Check for git
if ! type_exists 'git'; then
    e_header "Updating Homebrew..."
    brew update
    e_header "Installing Git..."
    brew install git
fi


# Ask before potentially overwriting files
seek_confirmation "Warning: This step may overwrite your existing dotfiles."
if is_confirmed; then
    mirrorfiles
    source ${HOME}/.bash_profile
else
    printf "Aborting...\n"
    exit 1
fi
#!/bin/sh

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
confirm() {
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
cmd_exists() {
    if [ $(type -P $1) ]; then
      return 0
    fi
    return 1
}

link() {
    # Move existing dotfile to dotfiles_old directory
    if [[ -f ~/${2} ]]; then
        # create backup folder if it doesn't exist
        if [[ ! -d $DOTFILES_OLD ]]; then
            mkdir $DOTFILES_OLD
        fi
        # backup old dotfile
        mv ~/${2} ${DOTFILES_OLD}/
    fi

    # Create new symlink.
    ln -nsf ${DOTFILES}/${1} ~/${2}
}


export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/libexec

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

export PATH="/usr/local/bin:/usr/local/share/python:${PATH}"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# SMLNJ path
export PATH="/usr/local/smlnj-110.75/bin/sml:$PATH"

# Node.JS path
export NODE_PATH="/usr/local/lib/node"

# Path addition added by MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Vim is default editor
export EDITOR='vim'

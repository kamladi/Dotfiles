# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/libexec:/Users/kamladi/.rvm/bin

export PATH="/usr/local/bin:/usr/local/share/python:$PATH"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# SMLNJ path
export PATH="/usr/local/smlnj/bin/sml:$PATH"

# Node.JS path
export NODE_PATH="/usr/local/lib/node"

# Path addition added by MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Vim is default editor
export EDITOR='vim'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# android sdk files
export PATH="/Users/kamladi/adt/sdk/tools:/Users/kamladi/adt/sdk/platform-tools:$PATH"

# MATLAB
export PATH="/Applications/MATLAB_R2013a.app/bin:$PATH"

# Amazon EC2 CLI setup
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/usr/local/ec2-api-tools-1.6.12.2
export PATH=$PATH:$EC2_HOME/bin

# Add aliases.
source ~/.aliases

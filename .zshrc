# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="arrow"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx rails sublime lol npm coffee cake battery)

source $ZSH/oh-my-zsh.sh

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
export AWS_ACCESS_KEY="AKIAICRD37SUYSJDJWGQ"
export AWS_SECRET_KEY="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"
export EC2_URL=https://ec2.us-west-2.amazonaws.com

# Add aliases.
source ~/.aliases

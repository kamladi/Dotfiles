# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# enable 'thefuck' plugin to autocorrect mistyped commands
eval "$(thefuck --alias)"

# enable 'z.sh': jumps to most 'frecent' directory
. ~/z/z.sh

## Customize to your needs...
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

# Library Python libs
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH"
export PATH="/Library/Python/2.7/site-packages/:$PATH"

# AVR-GCC Paths
export PATH="/usr/local/CrossPack-AVR/bin:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/Users/kamladi/go
export PATH=$PATH:/$GOPATH/bin

# LaTeX
export PATH=$PATH:/usr/texbin

# Amazon EC2 CLI setup
export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.1
export PATH=$PATH:$EC2_HOME/bin

# custom ls colors
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

# Add aliases.
source ~/.aliases

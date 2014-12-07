#!/bin/zsh

# For chromium
alias chromium="/home/srijan/Documents/local/chrome-linux/chrome"
export CHROME_DEVEL_SANDBOX="/home/srijan/Documents/local/chrome-linux/chrome_sandbox"

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Cabal
export PATH=$PATH:~/.cabal/bin

# Python
export WORKON_HOME=~/.virtualenvs
[ -e /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh


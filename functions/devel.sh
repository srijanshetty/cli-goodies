#!/bin/zsh

#pastebin
function pastebin() {
    curl -F 'sprunge=<-' http://sprunge.us < "${1:-/dev/stdin}";
}

# For chromium
alias chromium="/home/srijan/Documents/local/chrome-linux/chrome"
export CHROME_DEVEL_SANDBOX="/home/srijan/Documents/local/chrome-linux/chrome_sandbox"

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Cabal
export PATH=$PATH:~/.cabal/bin

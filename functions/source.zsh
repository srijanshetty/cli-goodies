#!/bin/zsh

# source autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

# source proxy configuration
. ~/.proxyrc

# Colors :D
eval `dircolors ~/.dircolors-light`

# nvm
NVM_DIR=~/.nvm
[ -s "/home/srijan/.nvm/nvm.sh" ] && . "/home/srijan/.nvm/nvm.sh"

# rvm
[[ -s '~/.rvm/scripts/rvm' ]] && . '~/.rvm/scripts/rvm'


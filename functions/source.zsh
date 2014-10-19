#!/bin/zsh

# source autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

# source proxy configuration
# . ~/.proxyrc

# Colors :D
eval `dircolors ~/.dircolors-light`

# rvm
[[ -s '~/.rvm/scripts/rvm' ]] && . '~/.rvm/scripts/rvm'


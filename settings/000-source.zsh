#
# Source
#

# source autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

# source proxy configuration
# . ~/.proxyrc

# source private functions
[[ -s ~/.private.sh ]] && source ~/.private.sh

# mr
[[ -s ~/.mrenv ]] && source ~/.mrenv

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

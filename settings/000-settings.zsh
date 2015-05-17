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

#
# Directory options
#
setopt AUTO_CD              # Writing the name of directory cd's into it

#
# Hooks
#

# Create the log if it does not exist
[ ! -e "$HOME/.install-log" ] && touch "$HOME/.install-log"

# Store an install log of all npm/pip/apt-get installs
preexec() {
    if [[ $1 =~ "^npm install" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [[ $1 =~ "^gem install" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [[ $1 =~ "^pip install" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [[ $1 =~ "^go (get|install)" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [[ $1 =~ "add-apt-repository" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [[ $1 =~ "apt-get install" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi
}

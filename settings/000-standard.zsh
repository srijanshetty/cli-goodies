###########################################
# Immedietely invoked
###########################################
#
# dircolors
eval "$(dircolors ~/.dircolors/dircolors.ansi-light)"

###########################################
# Shell bindings
###########################################

# Bash like Meta + dot
bindkey "^[." insert-last-word

###########################################
# Aliases
###########################################

# unicode support in tmux
alias tmux="tmux -u"

# top, the way it should be
alias top="top -c"

# Quick check for sha
alias sha='shasum -a 256 '

# ips
alias ipe='curl ipinfo.io/ip'

###########################################
# Hooks
###########################################

# Create the log if it does not exist
[ ! -e "$HOME/.install-log" ] && touch "$HOME/.install-log"

# Store an install log of all npm/pip/apt-get installs
preexec() {
    if [[ $1 =~ "(npm|gem|pip|brew|go|snap|apt|apt-get) (i|install|tap|get) " ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [[ $1 =~ "add-apt-repository" ]]; then
        echo "$1" >> "${HOME}/.install-log"
    fi
}

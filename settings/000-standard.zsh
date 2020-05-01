###########################################
# Immedietely invoked
###########################################
#
# dircolors
eval "$(dircolors ~/.dircolors/dircolors.ansi-light)"

# Ensure colors are support in TMUX
[ -n "$TMUX" ] && export TERM=xterm-256color

###########################################
# Shell bindings
###########################################

# Bash like Meta + dot
bindkey "^[." insert-last-word

# Enable Ctrl-f to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

###########################################
# Source
###########################################

# source private functions
[[ -s ~/.private.sh ]] && source ~/.private.sh

###########################################
# Use vi as EDITOR/VISUAL
###########################################
export EDITOR=vi
export VISUAL=vi

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

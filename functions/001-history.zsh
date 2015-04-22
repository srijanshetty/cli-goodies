#
# Variables
#

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"       # The path to the history file.
HISTSIZE=1000000000                  # The maximum number of events to save in the internal history.
SAVEHIST=1000000000                   # The maximum number of events to save in the history file.

#
# Options
#

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

#
# Aliases
#

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

#
# Functions
#

# Create the log if it does not exist
[ ! -e "$HOME/.install-log" ] && touch "$HOME/.install-log"

# Store an install log of all npm/pip/apt-get installs
preexec() {
    if [ $1 =~ "^npm install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "^gem install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "^pip install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "add-apt-repository" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "apt-get install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi
}

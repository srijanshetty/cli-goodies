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
    if [ $1 =~ "^npm install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "^gem install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "^pip install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "^go (get|install)" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "add-apt-repository" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi

    if [ $1 =~ "apt-get install" ]; then
        echo "$1" >> "${HOME}/.install-log"
    fi
}

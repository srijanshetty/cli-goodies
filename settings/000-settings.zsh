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

#
# Awesomeness
#
# Some awesomeness
alias cowcommit="wget -qO- http://whatthecommit.com/index.txt | cowsay"
alias cowsay='cowsay -f $(ls /usr/share/cowsay/cows | sort -R | head -1)'

# Stocks
function get-stock-change() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1c1"
}

function get-stock-price() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1"
}

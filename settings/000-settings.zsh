#
# Experimental
#

# Bash like Meta + dot
bindkey "^[." insert-last-word

# Stocks
function get-stock-change() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1c1"
}

function get-stock-price() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1"
}

###### Taken from https://github.com/raine/cli-goodies#aliases
alias now='date -u +"%Y-%m-%dT%H:%M:%SZ"' # print current datetime as ISO

function gist-clone() {
  gist_id=`echo "$1" | sed -e 's/.*\///g'`
  git clone git@gist.github.com:/$gist_id.git $2
}

# copy last command to clipboard
function copy-last-command() {
  fc -ln -1 | awk "{\$1=\$1}1" ORS="" | pbcopy
}

###########################################
#
# Alias
#
# To copy the last command output
alias -g fzfc="| fzf | pbcopy"

# Some awesomeness
alias cowcommit="wget -qO- http://whatthecommit.com/index.txt | cowsay"
alias cowsay='cowsay -f $(ls /usr/share/cowsay/cows | sort -R | head -1)'

# colored cat
alias c='pygmentize -O style=monokai -f console256 -g'

# vim -> gvim
alias vi="vim"

# vcsh specific aliases
alias vs="vcsh status"

# List all global npm packages
alias npm-list="npm list -g --depth 0"

# unicode support in tmux
alias tmux="tmux -u"

# top, the way it should be
alias top="top -c"

# Quick check for sha
alias sha='shasum -a 256 '

# ips
alias ipe='curl ipinfo.io/ip'

# dircolors
eval "$(dircolors ~/.dircolors/dircolors.ansi-light)"

#
# Hooks
#

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

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
#
# Git alias
alias glg="git lg"
alias gs="git status"
alias ga="git add --all"
alias gt="git tag"
alias gc="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gst="git stash"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gr="git remote"
alias grv="git remote -v"
alias gig="git ignore"

# If you give the command cd, then it goes to the git root if in a git directory
# or goes to $HOME of the user if not in a git directory
_git_cd () {
    if [[ "$1" != "" ]]; then
        cd "$@"
    else
        local OUTPUT
        OUTPUT="$(git rev-parse --show-toplevel 2>/dev/null)"
        if [[ -e "$OUTPUT" ]]; then
            if [[ "$OUTPUT" != "$(pwd)" ]]; then
                cd "$OUTPUT"
            else
                cd
            fi
        else
            cd
        fi
    fi
}
alias cd=_git_cd

# vim -> gvim
alias vi="vim"

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

###########################################
# Experimental
###########################################

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

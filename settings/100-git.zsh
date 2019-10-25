###########################################
# Git
###########################################
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

function gist-clone() {
  gist_id=`echo "$1" | sed -e 's/.*\///g'`
  git clone git@gist.github.com:/$gist_id.git $2
}

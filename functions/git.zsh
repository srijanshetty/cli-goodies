#Git alias
alias glg="git lg"
alias gs="git status"
alias ga="git add"
alias gt="git tag"
alias gcm="git commit -m"
alias gc="git checkout"
alias gb="git branch"
alias ack="ack-grep"

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


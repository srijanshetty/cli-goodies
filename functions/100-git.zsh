# Copyright (c) 2014 Srijan R Shetty <srijan.shetty+code@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Git alias
alias glg="git lg"
alias gs="git status"
alias ga="git add"
alias gt="git tag"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gc="git checkout"
alias gb="git branch"
alias gr="git remote"
alias gd="git diff"
alias gp="git push"
alias gst="git stash"

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


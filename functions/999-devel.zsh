#!/bin/zsh

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

#
# tmux
#
# Startup configuration for tmux
function startt() {
    case $1 in
        "iitk")
            # Create a new tmux-session
            SESSION="firewall"
            tmux -2 new-session -d -s $SESSION

            # Create the windows
            tmux rename-window -t $SESSION:1 firewall

            # Start defualt programs in them
            tmux send-keys -t $SESSION:1 "auth" C-m

            # Create another tmux-sesion for working
            SESSION=$(basename $PWD)
            tmux -2 new-session -d -s $SESSION

            # General purpose
            tmux rename-window -t $SESSION:1 general-purpose
            tmux split-window -h

            # The vim window
            tmux new-window -t $SESSION -a -n vim
            tmux split-window -h
            tmux select-pane -t 1
            tmux resize-pane -R 30

            # An empty window
            tmux new-window -t $SESSION -a

            # Attach the session
            tmux select-window -t $SESSION:3
            tmux attach -t $SESSION
            ;;

        "project")
            # Create another tmux-sesion for working
            SESSION=$(basename $PWD)
            tmux -2 new-session -d -s $SESSION

            # General purpose
            tmux rename-window -t $SESSION:1 general-purpose
            tmux split-window -h

            # The vim window
            tmux new-window -t $SESSION -a -n vim
            tmux split-window -h
            tmux select-pane -t 1
            tmux resize-pane -R 30

            # An empty window
            tmux new-window -t $SESSION -a

            # Attach the session
            tmux select-window -t $SESSION:3
            tmux attach -t $SESSION
            ;;

        *)
            # Create another tmux-sesion for working
            SESSION="General"
            tmux -2 new-session -d -s $SESSION

            # General purpose
            tmux rename-window -t $SESSION:1 general-purpose
            tmux send-keys -t $SESSION:1 "autostart" C-m
            tmux split-window -h
            tmux select-pane -t 1
            tmux resize-pane -R 30

            # The vim window
            tmux new-window -t $SESSION -a -n vim

            # An empty window
            tmux new-window -t $SESSION -a -n irc 'irssi'

            # Attach the session
            tmux select-window -t $SESSION:3
            tmux attach -t $SESSION
            ;;

    esac
}

#
# git
#
#Git alias
alias glg="git lg"
alias gs="git status"
alias ga="git add"
alias gt="git tag"
alias gc="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gp="git push"
alias gst="git stash"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gr="git remote"
alias grv="git remote -v"

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

#
# Go
#
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

#
# Cabal
#
export PATH=$PATH:~/.cabal/bin

#
# pyenv
#
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
    path=("$HOME/.pyenv/bin" $path)
    eval "$(pyenv init -)"
fi

#
# node
#
# List all global npm packages
alias npm-list="npm list -g --depth 0"

#
# Ruby
#
# RVM should be the last thing that is loaded
# Load RVM into the shell session.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Unset AUTO_NAME_DIRS since auto adding variable-stored paths to ~ list
  # conflicts with RVM.
  unsetopt AUTO_NAME_DIRS

  # Source RVM.
  source "$HOME/.rvm/scripts/rvm"
fi

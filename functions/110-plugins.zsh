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
# bind UP and DOWN arrow keys

############################
# history-substring-search #
############################
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

############
# zsh-dwim #
############

## rm -> rm -f
_dwim_add_transform '^rm' \
  '_dwim_sed "s/^rm /rm -f /"'

## rm -f -> rm -rf
_dwim_add_transform '^rm -f' \
  '_dwim_sed "s/^rm -f /rm -rf /"'

## rm -rf -> sudo rm -rf
_dwim_add_transform '^rm -rf' \
  '_dwim_sed "s/^rm -rf /sudo rm -rf /"'

## git rm -> git rm -r
_dwim_add_transform '^git rm' \
  '_dwim_sed "s/^git rm /git rm -r /"'

## cp -> cp -R
_dwim_add_transform '^cp ' \
  '_dwim_sed "s/^cp /cp -R /"'

## git clone -> git clone --recursive
_dwim_add_transform '^git clone ' \
  '_dwim_sed "s/^git clone /git clone --recursive /"'

## mkdir -p -> sudo mkdir -p
_dwim_add_transform '^mkdir -p ' \
  '_dwim_sed "s/^mkdir /sudo mkdir /"'

# mv $1 $2 -> cd $2
_dwim_add_transform '^mv ' \
  '_dwim_sed "s/^mv.*/cd \!\$/"'

# gd -> ga
_dwim_add_transform '^gd ' \
  '_dwim_sed "s/^gd /ga /"'

########
# tmux #
########

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

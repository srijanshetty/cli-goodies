#
# zsh-dwim
#
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

#
# tmux
#
# Startup configuration for tmux
# function startt() {
#     case $1 in
#         "iitk")
#             # Create a new tmux-session
#             SESSION="firewall"
#             tmux -2 new-session -d -s $SESSION
#
#             # Create the windows
#             tmux rename-window -t $SESSION:1 firewall
#
#             # Start defualt programs in them
#             tmux send-keys -t $SESSION:1 "auth" C-m
#
#             # Create another tmux-sesion for working
#             SESSION=$(basename $PWD)
#             tmux -2 new-session -d -s $SESSION
#
#             # General purpose
#             tmux rename-window -t $SESSION:1 general-purpose
#             tmux split-window -h
#
#             # The vim window
#             tmux new-window -t $SESSION -a -n vim
#             tmux split-window -h
#             tmux select-pane -t 1
#             tmux resize-pane -R 30
#
#             # An empty window
#             tmux new-window -t $SESSION -a
#
#             # Attach the session
#             tmux select-window -t $SESSION:3
#             tmux attach -t $SESSION
#             ;;
#
#         "project")
#             # Create another tmux-sesion for working
#             SESSION=$(basename $PWD)
#             tmux -2 new-session -d -s $SESSION
#
#             # General purpose
#             tmux rename-window -t $SESSION:1 general-purpose
#             tmux split-window -h
#
#             # The vim window
#             tmux new-window -t $SESSION -a -n vim
#             tmux split-window -h
#             tmux select-pane -t 1
#             tmux resize-pane -R 30
#
#             # An empty window
#             tmux new-window -t $SESSION -a
#
#             # Attach the session
#             tmux select-window -t $SESSION:3
#             tmux attach -t $SESSION
#             ;;
#
#         *)
#             # Create another tmux-sesion for working
#             SESSION="General"
#             tmux -2 new-session -d -s $SESSION
#
#             # General purpose
#             tmux rename-window -t $SESSION:1 general-purpose
#             tmux send-keys -t $SESSION:1 "autostart" C-m
#             tmux split-window -h
#             tmux select-pane -t 1
#             tmux resize-pane -R 30
#
#             # The vim window
#             tmux new-window -t $SESSION -a -n vim
#
#             # An empty window
#             tmux new-window -t $SESSION -a -n irc 'irssi'
#
#             # Attach the session
#             tmux select-window -t $SESSION:3
#             tmux attach -t $SESSION
#             ;;
#
#     esac
# }

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

#
# Go
#

if [[ -s "$HOME/.gvm/scripts/gvm" ]]; then
    source "$HOME/.gvm/scripts/gvm"
fi

#
# Plugins and Utilities
#
# Check for the hub alias and then eval it
hash hub &>/dev/null && eval "$(hub alias -s)"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# source proxy configuration
# . ~/.proxyrc

# source private functions
[[ -s ~/.private.sh ]] && source ~/.private.sh

# mr
[[ -s ~/.mrenv ]] && source ~/.mrenv

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# List all global npm packages
alias npm-list="npm list -g --depth 0"

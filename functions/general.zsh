#!/bin/zsh

# source autojump configuration
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

# Solarize the terminal
eval `dircolors ~/.dircolors-light`

# for changing the color scheme
# A variable to maintain the state of the color scheme
export scheme=1

alias solarize_light="${DOTDIR}/shells/solarize/install.sh -s light -p Solarized"
alias solarize_dark="${DOTDIR}/shells/solarize/install.sh -s dark -p Solarized"

function scheme() {
    export scheme=$(( (scheme+1)%2 ))
    if [ $scheme -eq "0" ]; then
       eval `dircolors ~/.dircolors-dark`
       solarize_dark
    else
       eval `dircolors ~/.dircolors-light`
       solarize_light
    fi
}

# This changes the apt-get sources
function apt-source() {
    case $1 in
        -l | --list )
            ls /etc/apt/ | grep 'sources.list.*';;
        -c | --change)
            cd /etc/apt
            if [ -f sources.list.$2 ];then
                sudo mv sources.list sources.list.backup
                sudo cp sources.list.$2 sources.list
                sudo apt-get update
            else
                echo "No such source file exists"
            fi
            cd -
    esac
}

# Create a folder and cd into it
function md() {
    mkdir $1 && cd $1
}

# To get the value of error codes
function errorcode() {
    python -c "import os; print os.strerror($1)";
}

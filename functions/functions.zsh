#!/bin/bash

# function for local-ip
function lip() {
    IP=$(ifconfig wlan0 | grep 'inet ' | awk '{print $2}' | awk -F : '{print $2}')

    if [ -n "$IP"]; then
        IP=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}' | awk -F : '{print $2}')
    fi

    echo $IP
}

# function for global-ip
function gip() {
    curl ifconfig.me
}

# Create a folder and cd into it
function md() {
    mkdir $1 && cd $1
}

# To get the value of error codes
function errorcode() {
    python -c "import os; print os.strerror($1)";
}

# send a directory
function sdp() {
    tar cvzf - $1 | ssh $2 'tar xzf -'
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

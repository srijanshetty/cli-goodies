#!/bin/zsh

# Function to use no proxy script in iitk, use local version if exists or else
# fallback to the copy
function auth() {
    if [ -f ~/Documents/firewall-auth.py ]; then
        python ~/Documents/firewall-auth.py
    else
        python ${DOTDIR}/scripts/firewall-auth.py
    fi
}

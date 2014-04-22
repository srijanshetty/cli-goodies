#!/bin/zsh
function server() {
    local port="${1:-8000}"
    o "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

alias ip="curl ifconfig.me"
alias bower='noglob bower'

# For chromium
export CHROME_DEVEL_SANDBOX="/usr/bin/chrome_sandbox"
alias chrome="chrome >&/dev/null &"

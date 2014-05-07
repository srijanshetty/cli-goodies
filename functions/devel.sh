#!/bin/zsh

alias ip="curl ifconfig.me"
alias bower='noglob bower'

# Taken for @addyosmani's dotfiles
# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    o "http://localhost:${port}/"
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"

    # python -m SimpleHTTPServer "$port"
}

alias chromium="/home/srijan/Documents/local/chrome-linux/chrome"
export CHROME_DEVEL_SANDBOX="/home/srijan/Documents/local/chrome-linux/chrome_sandbox"

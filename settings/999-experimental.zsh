###### Taken from https://github.com/raine/cli-goodies#aliases
alias now='date -u +"%Y-%m-%dT%H:%M:%SZ"' # print current datetime as ISO

# copy last command to clipboard
function copy-last-command() {
  fc -ln -1 | awk "{\$1=\$1}1" ORS="" | pbcopy
}

# Restart a WiFi connection
function wifi-restart() {
    local current=$(nmcli d wifi list | grep '*' | awk '{print $2}')
    nmcli c down $current && nmcli c up $current
}

# Get the current FX rate
function fx() {
    local base=${2:-USD}

    if has http &> /dev/null; then
        http "https://api.exchangeratesapi.io/latest?symbols=${1}&base=${base}" -b
    else
        curl "https://api.exchangeratesapi.io/latest?symbols=${1}&base=${base}" | jq
    fi
}

eval "$(fnm env)"

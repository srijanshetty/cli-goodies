###### Taken from https://github.com/raine/cli-goodies#aliases
alias now='date -u +"%Y-%m-%dT%H:%M:%SZ"' # print current datetime as ISO

# copy last command to clipboard
function copy-last-command() {
  fc -ln -1 | awk "{\$1=\$1}1" ORS="" | pbcopy
}

# count occurences
alias count='sort | uniq -c | sort -n'

# Restart a WiFi connection
function wifi-restart() {
    local current=$(nmcli d wifi list | grep '*' | awk '{print $2}')
    nmcli c down $current && nmcli c up $current
}

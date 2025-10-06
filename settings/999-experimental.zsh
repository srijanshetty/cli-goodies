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

function cgrok() {
    local port=${1:-3001}
    cloudflared tunnel --url "http://localhost:${port}"
}

function z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

function gist-clone() {
  gist_id=`echo "$1" | sed -e 's/.*\///g'`
  git clone git@gist.github.com:/$gist_id.git $2
}

if which fnm > /dev/null; then
  eval "$(fnm env)"
fi

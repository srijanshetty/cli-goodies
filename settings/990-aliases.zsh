#
# Sensible defaults
#

# vcsh specific aliases
alias vs="vcsh status"

# Search
alias ag='ag --path-to-ignore ~/.ignore'

# List all global npm packages
alias npm-list="npm list -g --depth 0"

# unicode support in tmux
alias tmux="tmux -u"

# top, the way it should be
alias top="top -c"

# podman
alias pd="podman"
alias pc="podman-compose"

#
# Utilities
#

# Quick check for sha
alias sha='shasum -a 256 '

# external ip
alias ipe='curl ipinfo.io/ip'

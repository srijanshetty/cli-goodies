#
# Plugins and Utilities
#

# vcsh specific aliases
alias vs="vcsh status"

# Search
alias ag='ag --path-to-ignore ~/.ignore'

# List all global npm packages
alias npm-list="npm list -g --depth 0"

# mr
[[ -s ~/.mrenv ]] && source ~/.mrenv

# linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="$HOME/.linuxbrew/sbin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# source private functions
[[ -s ~/.private.sh ]] && source ~/.private.sh

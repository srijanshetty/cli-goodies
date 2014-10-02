# Export the DOTDIR directory variable for use by other modules
export DOTDIR=~/Documents/dotfiles
export LOCAL_BIN=~/Documents/local/bin
export GITHUB_DIR=~/Documents/GitHub

# colorize every grep
alias grep="grep --color"

# colored cat
alias c='pygmentize -O style=monokai -f console256 -g'

# For cut copy operations
alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"

# Music tagging
alias id3="id3tool"

# Bower needs this
alias bower='noglob bower'


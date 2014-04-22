# Export the DOTDIR directory variable for use by other modules
export DOTDIR="~/Documents/dotfiles"

# Some awesomeness
alias nyan="telnet miku.acm.uiuc.edu"

#colorize every grep
alias grep="grep --color"

#colored cat
alias c='pygmentize -O style=monokai -f console256 -g'

#For cut copy operations
alias xclip="xclip -selection c"

#Put a copy of the GNU GPL LICENSE
alias gpl="wget http://www.gnu.org/licenses/gpl.txt -O LICENSE"

# Print json
alias json="underscore --color print --in"

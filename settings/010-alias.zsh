# Copyright (c) 2014 Srijan R Shetty <srijan.shetty+code@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# colored cat
alias c='pygmentize -O style=monokai -f console256 -g'

# For cut copy operations
alias xcopy="xclip -selection c"
alias xpaste="xclip -selection c -o"

# Music tagging
alias id3="id3tool"

# Bower needs this
alias bower='noglob bower'

# vim -> gvim
alias vim="gvim"
alias vi="gvim"

# vcsh specific aliases
alias vs="vcsh status"

# Make ls output colored
alias ls="ls --color --group-directories-first"

# Alias open
alias o="xdg-open"

# Correct commands.
setopt CORRECT

# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias gcc='nocorrect gcc'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Define general aliases.
alias cp="cp -i"
alias rm="rm -i"

# File Download
alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
alias get='wget --continue --progress=bar --timestamping'

# Resource Usage
alias df='df -kh'
alias du='du -kh'

# Open websites directly
alias -s org=google-chrome
alias -s com=google-chrome
alias -s in=google-chrome
alias -s io=google-chrome
alias -s mp4=vlc
alias -s avi=vlc
alias -s mkv=vlc
alias -s mp3=vlc

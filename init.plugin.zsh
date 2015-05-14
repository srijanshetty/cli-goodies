#!/bin/zsh

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

#
# Settings
#
# Source files in functions directory
for file in ${0:h}/settings/**/*(.); do
    source "$file"
done

#
# Scripts
#

# Add the scripts folder to PATH
PLUGIN_D="$(dirname $0)"
export PATH="${PATH}:${PLUGIN_D}/scripts"

# File that have been taken from other git repos
if [ -e "${0:h}/external" ]; then
    for file in ${0:h}/external/**/*(.); do
        source "$file"
    done
fi


#
# Functions and Completions
#

# Add completions to $fpath.
fpath=("${0:h}/functions" $fpath)

# Load functions which are not completions
for pfunction in ${0:h}/functions/^[_.]*; do
  func=$(echo $pfunction | tr '/' ' ' | awk '{print $NF}')
  autoload -Uz "$func"
done

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

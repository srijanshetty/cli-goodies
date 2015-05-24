#!/bin/zsh

#
# Source init.zsh
#
source "${0:h}/init.zsh"

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

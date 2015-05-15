#!/bin/zsh

#
# Source init.zsh
#
source init.zsh

# Load functions which are not completions
for pfunction in ${0:h}/functions/^[_.]*; do
  func=$(echo $pfunction | tr '/' ' ' | awk '{print $NF}')
  autoload -Uz "$func"
done

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

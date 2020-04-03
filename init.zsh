#!/bin/zsh

#
# Settings
#
# Source files in functions directory
for file in ${0:h}/settings/**/*(.); do
    source "$file"
done

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

# Add external to $fpath
fpath=("${0:h}/external" $fpath)

# Source functions which are not completions
for pfunction in ${0:h}/functions/^[_.]*; do
    source $pfunction
done

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

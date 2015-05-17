#!/bin/zsh

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

#
# Functions and Completions
#

# Add completions to $fpath.
fpath=("${0:h}/functions" $fpath)

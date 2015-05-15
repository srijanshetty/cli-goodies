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

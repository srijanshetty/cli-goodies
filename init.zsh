#!/bin/zsh

#
# Settings
#
# Source files in functions directory
for file in ${0:h}/settings/**/*(.); do
    source "$file"
done

#
# Plugins
#

# Load functions which are not completions
if [ -d ${0:h}/plugins ]; then
    for pfunction in ${0:h}/plugins/**/*.plugin.zsh; do
        source $pfunction
    done
fi

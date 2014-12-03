#!/bin/zsh

# Source every file in custom
for file in $(ls "${0:h}/functions"); do
    source "${0:h}/functions/$file"
done

# For any external imported files
if [ -e "${0:h}/external" ]; then
    for file in $(ls "${0:h}/external"); do
        source "${0:h}/external/$file"
    done
fi

# Add zsh-completions to $fpath.
fpath=("${0:h}/completion" $fpath)

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

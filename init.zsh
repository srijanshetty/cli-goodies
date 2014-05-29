#!/bin/zsh

# For all the completion scripts
# fpath=("${0:h}/completion/" $fpath)

# Source every file in custom
for file in $(ls "${0:h}/functions"); do
    source "${0:h}/functions/$file"
done

# For any external imported files
for file in $(ls "${0:h}/external"); do
    source "${0:h}/external/$file"
done

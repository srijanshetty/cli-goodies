#!/bin/zsh

# Source every file in custom
for file in $(ls "${0:h}/functions"); do
    source "${0:h}/functions/$file"
done

for file in $(ls "${0:h}/external"); do
    source "${0:h}/external/$file"
done

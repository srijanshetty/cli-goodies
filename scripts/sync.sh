#!/bin/zsh

setopt nullglob
setopt dotglob # To include hidden files
files=(./$1/*)

if [ ${#files[@]} -gt 0 ]; then
    rsync $1/ $2/ -a --copy-links -v
    for file in "${files[@]}"; do
        trash $file
    done
fi

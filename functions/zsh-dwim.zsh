#!/bin/zsh

## rm -> rm -f
_dwim_add_transform '^rm' \
  '_dwim_sed "s/^rm /rm -f /"'

## rm -f -> rm -rf
_dwim_add_transform '^rm -f' \
  '_dwim_sed "s/^rm -f /rm -rf /"'

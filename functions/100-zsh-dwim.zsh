#!/bin/zsh

# Copyright (c) 2014 Srijan R Shetty <srijan.shetty+code@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## rm -> rm -f
_dwim_add_transform '^rm' \
  '_dwim_sed "s/^rm /rm -f /"'

## rm -f -> rm -rf
_dwim_add_transform '^rm -f' \
  '_dwim_sed "s/^rm -f /rm -rf /"'

## rm -rf -> sudo rm -rf
_dwim_add_transform '^rm -rf' \
  '_dwim_sed "s/^rm -rf /sudo rm -rf /"'

## git rm -> git rm -r
_dwim_add_transform '^git rm' \
  '_dwim_sed "s/^git rm /git rm -r /"'

## cp -> cp -R
_dwim_add_transform '^cp ' \
  '_dwim_sed "s/^cp /cp -R /"'

## git clone -> git clone --recursive
_dwim_add_transform '^git clone ' \
  '_dwim_sed "s/^git clone /git clone --recursive /"'

## mkdir -p -> sudo mkdir -p
_dwim_add_transform '^mkdir -p ' \
  '_dwim_sed "s/^mkdir /sudo mkdir /"'

# mv $1 $2 -> cd $2
_dwim_add_transform '^mv ' \
  '_dwim_sed "s/^mv.*/cd \!\$/"'

# gd -> ga
_dwim_add_transform '^gd ' \
  '_dwim_sed "s/^gd /ga /"'

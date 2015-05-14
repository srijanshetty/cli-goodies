#!/bin/bash

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

# function for local-ip
function lip() {
    IP=$(ifconfig wlan0 | grep 'inet ' | awk '{print $2}' | awk -F : '{print $2}')

    if [ -n "$IP" ]; then
        IP=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}' | awk -F : '{print $2}')
    fi

    echo "$IP"
}

# function for global-ip
function gip() {
    curl ifconfig.me
}

# Create a folder and cd into it
function md() {
    mkdir "$1" && cd "$1"
}

######################################################################

# To get the value of error codes
function errorcode() {
    python -c "import os; print os.strerror($1)";
}

# https://transfer.sh/
function transfer() {
    curl --upload-file "$1" "http://transfer.sh/${1}"
}

# Stocks
function get-stock-change() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1c1"
}

function get-stock-price() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1"
}

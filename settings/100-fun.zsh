# Some awesomeness
alias nyan="telnet miku.acm.uiuc.edu"
alias cowcommit="wget -qO- http://whatthecommit.com/index.txt | cowsay"
alias cowsay='cowsay -f $(ls /usr/share/cowsay/cows | sort -R | head -1)'

# Show a clock
function clock() {
    watch -n1 "date '+%D%n%T'|figlet -k"
}

# Taken from http://www.commandlinefu.com/commands/view/6065/show-demo-of-toilet-fonts
# List all toilet fonts
function showtoiletfonts() {
    find /usr/share/figlet -name "*.?lf" -exec basename {}  \; | sed -e "s/\..lf$//" | xargs -I{} toilet -f {} {}
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

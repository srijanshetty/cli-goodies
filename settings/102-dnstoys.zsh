# Define a word
function define() {
    dig +short '$1.dict' @dns.toys
}

# external ip
alias ipe='dig ip +short @dns.toys'

# Get the weather in bangalore
alias bw='dig bengaluru.weather +short @dns.toys'

# Get time
alias dub='dig dubai.time +short @dns.toys'
alias ldn='dig london.time +short @dns.toys'
alias sgp='dig singapore.time +short @dns.toys'
alias nyc='dig newyork.time +short @dns.toys'

# Define a word
function define() {
    dig +short '$1.dict' @dns.toys
}

# Generic alias
alias dy='dig +short @dns.toys'

# external ip
alias ipe='dig ip +short @dns.toys'

# Get the weather in bangalore
alias w-blr='dig bengaluru.weather +short @dns.toys'

# Get time
alias t-dub='dig dubai.time +short @dns.toys'
alias t-ldn='dig london.time +short @dns.toys'
alias t-sgp='dig singapore.time +short @dns.toys'
alias t-nyc='dig newyork.time +short @dns.toys'

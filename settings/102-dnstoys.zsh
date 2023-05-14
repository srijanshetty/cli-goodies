# Define a word
function define() {
    dig +short '$1.dict' @dns.toys
}

# Generic alias
alias dt='dig +short @dns.toys'

# external ip
alias ipe='dig ip +short @dns.toys'

# Get the weather in bangalore
alias we-blr='dig bengaluru.weather +short @dns.toys'

# Get time
alias tz-dub='dig dubai.time +short @dns.toys'
alias tz-ldn='dig london.time +short @dns.toys'
alias tz-sgp='dig singapore.time +short @dns.toys'
alias tz-nyc='dig newyork.time +short @dns.toys'

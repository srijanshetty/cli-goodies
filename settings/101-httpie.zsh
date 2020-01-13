# Use session file if present for http
function http() {
    if hash http &> /dev/null; then
        command http --session=./.session.json $@
    else
        echo "command is not installed"
    fi
}

# This function extracts cookie information from the headers of
# an httpie request and then stores it in a .session-file
function set-cookie() {
    setopt clobber

    # Extract bookie after login
    COOKIE=$(http "$@" --print=h | grep 'Cookie' | cut -d: -f2 | cut -c2-)

    echo "The cookie is: $COOKIE"

    # Create a session file
    cat > .session.json <<- EOF
{
    "headers": {
        "Cookie": "${COOKIE}"
    }
}
EOF

    # Remove line endings
    sed -i 's/\r//g' .session.json
}

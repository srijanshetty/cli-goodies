function mbox-update() {
    wget http://pdos.csail.mit.edu/mbox/mbox-latest-amd64.deb > /dev/null && sudo dpkg -i mbox-latest-amd64.deb \
        && rm -rf mbox-latest-amd64.deb
}

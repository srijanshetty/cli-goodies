#!/bin/bash

# Script to randomly set Background from files in a directory

# Directory Containing Pictures
DIR="/media/srijan/sync/Dropbox/wallpapers"

# Necessary for cron to work
# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# Command to Select a random jpg file from directory
# Delete the *.jpg to select any file but it may return a folder
PIC=$(ls --sort=time $DIR/*.* | head -1)

# Command to set Background Image on elementary OS
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"

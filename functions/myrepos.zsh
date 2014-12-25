#!/bin/zsh

function repos() {
    CURRENT_DIR=${PWD}

    function _repos-help() {
cat << _EOH_

USAGE: repos <command> [arguments]

COMMAND:

    add-git         add a git configuration
    available       list available configurations
    disable         diable a configuration
    enable          enable a configuration
    list            list current configurations

_EOH_
    }

    function _repos-list() {
        ls ~/.config/mr/config.d
    }

    function _repos-available() {
        ls ~/.config/mr/available.d
    }

    function _repos-enable() {
        cd ~/.config/mr/config.d/ && ln -s "../available.d/$1" .
    }

    function _repos-disable() {
        cd ~/.config/mr/config.d/ && rm -f "$1"
    }

    function _repos-add-git() {
        sed "s|REPO_NAME|$1|g" ~/.config/mr/available.d/template.vcsh > ~/.config/mr/available.d/"${1}".vcsh
    }

    case "$1" in
        l | list)           _repos-list;;
        e | enable)         _repos-enable "$2";;
        d | disable)        _repos-disable "$2";;
        a | avaliable)      _repos-avaliable;;
        ag | add-git)       _repos-add-git "$2";;
        *)                  _repos-help;;
    esac

    # Jump back to the directory from where we started
    cd "$CURRENT_DIR"
}

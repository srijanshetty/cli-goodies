#!/bin/zsh

function repos() {
    CURRENT_DIR=${PWD}

    function _repos-help() {
cat << _EOH_

USAGE: repos <command> [arguments]

COMMAND:

    --add-git         add a github configuration
    --add-bit         add a bitbucket configuration
    --available       list available configurations
    --check           list all repos not in mrconfig
    --disable         diable a configuration
    --enable          enable a configuration
    --list            list current configurations
    --only            only enable one configuration

_EOH_
    }

    function _file-check() {
        [[ -e ~/.config/mr/available.d/"$1" ]]
    }

    function _repos-list() {
        ls ~/.config/mr/config.d
    }

    function _repos-available() {
        ls ~/.config/mr/available.d
    }

    function _repos-enable() {
        _file-check "$1" && cd ~/.config/mr/config.d/ && ln -s "../available.d/$1" .
    }

    function _repos-disable() {
        cd ~/.config/mr/config.d/ && rm -f "$1"
    }

    function _repos-add-git() {
        sed "s|REPO_NAME|$1|g" ~/.config/mr/available.d/template-github.vcsh > ~/.config/mr/available.d/"${1}".vcsh
    }

    function _repos-add-bit() {
        sed "s|REPO_NAME|$1|g" ~/.config/mr/available.d/template-bitbucket.vcsh > ~/.config/mr/available.d/"${1}".vcsh
    }

    function _repos-only() {
        _file-check "$1" && /bin/rm -f ~/.config/mr/config.d/* && _repos-enable "$1"
    }

    function _repos-check() {
        for file in ./*; do
            < .mrconfig grep "$file" &>/dev/null || echo "$file";
        done
    }

    case "$1" in
        -ls | --list)           _repos-list;;
        -e | --enable)         _repos-enable "$2";;
        -d | --disable)        _repos-disable "$2";;
        -a | --avaliable)      _repos-available;;
        -c | --check)          _repos-check;;
        -ag | --add-git)       _repos-add-git "$2";;
        -ab | --add-bit)       _repos-add-bit "$2";;
        -o | --only)           _repos-only "$2";;
        *)                  _repos-help;;
    esac

    # Jump back to the directory from where we started
    cd "$CURRENT_DIR"
}

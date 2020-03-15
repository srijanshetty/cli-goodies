if [[ -f ~/.fzf.zsh ]]; then 
    # Sane defaults
    source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS='-m --height 60% --layout=reverse --border'
    export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'

    function join-lines() {
        local item
        while read item; do
            echo -n "${(q)item} "
        done
    }

    # This is for completion of ssh hosts
    function list-hosts() {
        cat <(cat ~/.ssh/config ~/.ssh/config.d/* /etc/ssh/ssh_config 2> /dev/null | command grep -i '^\s*host\(name\)\? ' | command grep -v '[*?]' | awk '{for (i = 2; i <= NF; i++) print $1 " " $i}') | awk '{if (length($2) > 0) {print $2}}' | sort -u | fzf-down --ansi --multi --tac --preview-window right:70%
    }

    zle -N list-hosts
    bindkey '^k^s' list-hosts

    # -------------
    # GIT heart FZF
    # -------------

    function is_in_git_repo() {
        git rev-parse HEAD > /dev/null 2>&1
    }

    function fzf-down() {
        fzf --height 50% "$@" --border
    }

    function gf() {
        is_in_git_repo || return
        git -c color.status=always status --short |
            fzf-down -m --ansi --nth 2..,.. \
            --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
            cut -c4- | sed 's/.* -> //'
        }

    function gb() {
        is_in_git_repo || return
        git branch -a --color=always | grep -v '/HEAD\s' | sort |
            fzf-down --ansi --multi --tac --preview-window right:70% \
            --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
            sed 's/^..//' | cut -d' ' -f1 |
            sed 's#^remotes/##'
        }

    function gt() {
        is_in_git_repo || return
        git tag --sort -version:refname |
            fzf-down --multi --preview-window right:70% \
            --preview 'git show --color=always {} | head -'$LINES
        }

    function gh() {
        is_in_git_repo || return
        git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
            fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
            --header 'Press CTRL-S to toggle sort' \
            --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
            grep -o "[a-f0-9]\{7,\}"
        }

    function gr() {
        is_in_git_repo || return
        git remote -v | awk '{print $1 "\t" $2}' | uniq |
            fzf-down --tac \
            --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
            cut -d$'\t' -f1
        }

    function bind-git-helper() {
        local c
        for c in $@; do
            eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
            eval "zle -N fzf-g$c-widget"
            eval "bindkey '^k^$c' fzf-g$c-widget"
        done
    }
    bind-git-helper f b t r h
    unset -f bind-git-helper
fi

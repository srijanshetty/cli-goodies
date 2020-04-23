# Open pet exec
function open-pet() {
    pet exec
}
zle -N open-pet
bindkey '^k^e' open-pet

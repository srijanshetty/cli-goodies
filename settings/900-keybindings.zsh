# Open pet exec
function open-pet() {
    pet exec
}
zle -N open-pet
bindkey '^k^k' open-pet

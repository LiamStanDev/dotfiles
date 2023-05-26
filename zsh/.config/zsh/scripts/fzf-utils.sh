#!/bin/bash

fzf-open-editor-here() {
    find . -type f |  fzf | xargs -r $EDITOR 
}

fzf-open-editor-home() {
    find ~ -type f | fzf | xargs $EDITOR  
}

fzf-cd-here() {
    local selected_file=$(du -S . | awk '{print $2}' | fzf)
    local directory=$(dirname "$selected_file")
    cd "$directory"
}

fzf-cd-home() {
    local search_path=(~/.config ~/Documents ~/.local ~/dotfiles ~/.config/dotfiles)
    local directory=$(du -S ${search_path} | awk '{print $2}' | fzf)
    cd "$directory"
}

# alias se="fzf-open-editor-here"
alias se="fzf-open-editor-home"
# alias sd="fzf-cd-here"
alias sd="fzf-cd-home"

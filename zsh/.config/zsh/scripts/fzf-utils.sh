#!/bin/bash

if [[ $OSTYPE =~ ^linux ]]; then

    fzf-open-editor-here() {
        find . -type f |  fzf | xargs -r $EDITOR
    }

    fzf-open-editor-home() {
        find ~ -type f | fzf | xargs -r $EDITOR
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
fi

if [[ $OSTYPE =~ ^darwin  ]]; then
    fzf-open-editor-here() {
        find . -type f | fzf | xargs -o $EDITOR
    }

    fzf-open-editor-home() {
        find ~ -type f | fzf | xargs -o $EDITOR
    }

    fzf-cd-here() {
        local selected_file=$(du -sm . | awk '{print $2}' | fzf)
        local directory=$(dirname "$selected_file")
        cd "$directory"
    }

    fzf-cd-home() {
        local search_path=(~/.config ~/Documents ~/.local ~/dotfiles ~/.config/dotfiles)
        local directory=$(find ${search_path} -d | fzf)
        cd "$directory"
    }
fi



# alias se="fzf-open-editor-here"
alias se="fzf-open-editor-home"
# alias sd="fzf-cd-here"
alias sd="fzf-cd-home"

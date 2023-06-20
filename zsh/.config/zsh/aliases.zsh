# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# logo-ls
if [ -x "${HOME}/.local/bin/logo-ls" ]; then
    alias l="logo-ls"
    alias ll='logo-ls -l'
    alias la='logo-ls -la'
fi

# neovim
alias n="nvim"
alias nv="nvim"
alias v="nvim"

# tmux
alias t="tmux"
alias tn="tmux new -s"
alias td="tmux detach"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"

# lazygit
alias lzg="lazygit"

#lazy docker
alias lzd="lazydocker"

# dotnet CLI
alias dotnet-w="dotnet watch --no-hot-reload --project"
alias dotnet-r='dotnet run --project'
alias dotnet-b='dotnet build'

# logoff
# alias logoff="gnome-session-quit" # need to change by the user name

source "$HOME/.config/zsh/scripts/fzf-utils.sh"

# macOS
if [[ $OSTYPE =~ ^darwin ]]; then
    source "$HOME/.config/zsh/macos-export.zsh"
fi

# linux
if [[ $OSTYPE =~ ^linux ]]; then
    source "$HOME/.config/zsh/linux-export.zsh"
fi

# default app
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# for the system varaible
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:$PATH"

# npm install global path
export NPM_CONFIG_PREFIX=~/.npm-global

# oh-my-posh
# eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/oh-my-posh/liam.omp.json)"

# srarship prop (need locale UTF8)
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# setting local binary path
export PATH="$HOME/.local/bin:$PATH"

# rust env
export PATH="$HOME/.cargo/env:$PATH"

# dotnet sdk path
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$DOTNET_ROOT:$PATH

# dotnet tool
export PATH="$HOME/.dotnet/tools:$PATH"

# rust evn
export PATH="$HOME/.cargo/bin:$PATH"

# nvim mason exe path
export PAHT="$HOME/.local/share/nvim/mason/bin:$PATH"

# secret api keys
plug "$HOME/.config/zsh/api-keys.zsh"

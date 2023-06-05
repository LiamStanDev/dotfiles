# macOS
if [[ $OSTYPE =~ ^darwin ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export XDG_CONFIG_HOME="$HOME/.config"
    # for macOS deamon connection problem
    # do following command first
    # sudo ln -s ~/Library/Containers/com.docker.docker/Data/docker.raw.sock /var/run/docker.sock
    export DOCKER_HOST="unix:///var/run/docker.sock"
fi

# linux
if [[ $OSTYPE =~ ^linux ]]; then
    plug "$HOME/.config/zsh/enviroment.zsh"
    # nvim
    export PATH="$HOME/.local/nvim-linux64/bin:$PATH"
    # miniconda
    export PATH="$HOME/.local/share/miniconda3/bin:$PATH"
fi

# for the system varaible
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:$PATH"

# setting local binary path
export PATH="$HOME/.local/bin:$PATH"

# oh-my-posh
# eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/oh-my-posh/liam.omp.json)"
# srarship prop
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# rust env
export PATH="$HOME/.cargo/env:$PATH"

# dotnet sdk path
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$DOTNET_ROOT:$PATH

# dotnet tool
export PATH="$HOME/.dotnet/tools:$PATH"

# npm install global path
export NPM_CONFIG_PREFIX=~/.npm-global
# rust evn
export PATH="$HOME/.cargo/bin:$PATH"

# nvim mason exe path
export PAHT="$HOME/.local/share/nvim/mason/bin:$PATH"

# secret api keys
plug "$HOME/.config/zsh/api-keys.zsh"

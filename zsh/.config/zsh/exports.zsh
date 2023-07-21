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
export PATH="$PATH:/usr/bin:/usr/sbin:/usr/local/bin"

# npm install global path
export NPM_CONFIG_PREFIX=~/.npm-global

# oh-my-posh
# eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/oh-my-posh/liam.omp.json)"

# srarship prop (need locale UTF8)
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# setting local binary path
export PATH="$PATH:$HOME/.local/bin"

# rust env
export PATH="$PATH:$HOME/.cargo/env"

# dotnet sdk path
export DOTNET_ROOT=/usr/share/dotnet
export PATH="$PATH:$DOTNET_ROOT"

# dotnet tool
export PATH="$PATH:$HOME/.dotnet/tools"

# rust evn
export PATH="$PATH:$HOME/.cargo/bin"
# export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# nvim mason exe path
export PAHT="$PATH:$HOME/.local/share/nvim/mason/bin"

# go env
export GOROOT="$HOME/.local/go"
export PATH="$PATH:$GOROOT/bin:$HOME/go/bin"

# risc-v toolchain
export RISCV="$HOME/.local/riscv"
export PATH="$PATH:$RISCV/tools/bin:$RISCV/qemu/bin"

# secret api keys
plug "$HOME/.config/zsh/api-keys.zsh"

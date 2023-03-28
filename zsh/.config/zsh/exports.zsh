# for the system varaible
export PATH="/usr/bin:/usr/sbin:/usr/local/bin:$PATH"

# oh-my-posh
# eval "$(oh-my-posh --init --shell zsh --config $HOME/.config/oh-my-posh/liam.omp.json)"

# dotnet sdk path
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$DOTNET_ROOT:$PATH

# dotnet tool
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# yarn path
# npm config set prefix "$HOME/.npm-global" # set the npm for the system first time 
export PATH="$HOME/.npm-global/bin:$PATH"

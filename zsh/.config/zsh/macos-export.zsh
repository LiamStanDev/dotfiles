export PATH="/opt/homebrew/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# docker
# for macOS deamon connection problem
# do following command first
# sudo ln -s ~/Library/Containers/com.docker.docker/Data/docker.raw.sock /var/run/docker.sock
export DOCKER_HOST="unix:///var/run/docker.sock"
# nvim
export PATH="$HOME/.local/nvim-macos/bin:$PATH"

# miniconda
export PATH="$HOME/.local/miniconda3/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lindazhong/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lindazhong/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lindazhong/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lindazhong/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate


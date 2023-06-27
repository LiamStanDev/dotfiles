source "$HOME/.config/zsh/enviroment.zsh"
# nvim
export PATH="$HOME/.local/nvim-linux64/bin:$PATH"
# miniconda
export PATH="$HOME/.local/miniconda3/bin:$PATH"

# >>> conda initialize >>>
# !! contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/liam/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/liam/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/liam/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/liam/.local/miniconda3/bin:$PATH"
    fi
fi
# <<< conda initialize <<<
conda activate

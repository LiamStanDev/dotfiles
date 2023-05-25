# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ $OSTYPE =~ ^linux ]]; then
     __conda_setup="$('/home/liam/.local/share/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/liam/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/liam/.local/share/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/liam/.local/share/miniconda3/bin:$PATH"
        fi
    fi
fi

if [[ $OSTYPE =~ ^darwin  ]]; then
    __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
fi
unset __conda_setup
conda config --set changeps1 False # for starship
 # <<< conda initialize <<<

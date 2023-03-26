# XDG PAtgs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share/
export XDG_RUNTIME_DIR=$HOME/tmp/

# cancel caps lock
setxkbmap -option caps:none
# map caps to Numlock
xmodmap -e "keycode 66 = Num_Lock"

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh

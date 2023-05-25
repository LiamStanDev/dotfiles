# history
HISTFILE=~/.zsh_history
# find zap, then use zap. repo: zap-zsh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/aliases.zsh"


# plugins
plug "conda-incubator/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

# for specific app
plug "$HOME/.config/zsh/conda-setup.zsh"
plug "$HOME/.config/zsh/dotnet-setup.zsh"

# auto show
# neofetch

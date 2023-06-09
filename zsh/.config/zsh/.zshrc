# history
HISTFILE=~/.zsh_history
# find zap, then use zap. repo: zap-zsh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# source
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/aliases.zsh"


# plugins
plug "conda-incubator/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
# plug "zap-zsh/zap-prompt"

# for specific app
source "$HOME/.config/zsh/dotnet-setup.zsh"

# auto show
# neofetch

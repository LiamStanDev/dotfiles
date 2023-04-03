# My Dotfiles
This is my configuaration in linux and macOS for daily usage.
* Operating System: Archlinux, MacOS
* Window Manager: Hyprland
* Shell: Zsh with Zap and Starship
* Terminal: kitty 
* Git GUI: lazygit
* Topbar: Waybar
* Notify Daemon: Dunst
* App Launcher: Wofi
* File Manager: Thunar
* Editor: Neovim, Vscode 

## Screenshot
![Alt text](./.assets/Screenshot-dashboard.png?raw=true "Neovim")
![Alt text](./.assets/Screenshot-coding.png.png?raw=true)
![Alt text](./.assets/Screenshot-terminal.png?raw=true)
![Alt text](./.assets/Screenshot-toggleterm.png?raw=true)
![Alt text](./.assets/Screenshot-btop.png?raw=true "Btop")

## Requirements
* paru : AUR for archlinux.
* Homebrew : package manager for macOS.
* stow(optional) : for quick setup the dotfiles.
```bash
paru stow # for Archlinux
brew install stow # for macOS
```
* Zap : zsh plugin manager
```zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
```
* Starship
```zsh
paru starship # for Archlinux
brew install starship
```
## Installation
Copy the following command in your terminal.
### For Everything
```bash
git clone https://github.com/Liam-Lin0107/dotfiles.git ~/
cd ~/dotfiles
rm -rf .git # remove my git you can use yours.
stow --ignore=".git" */ # Everything except .gitignore, .git folder, adn etc.
```
### For only my neovim setting
```bash
git clone https://github.com/Liam-Lin0107/dotfiles.git ~/
cd ~/dotfiles
rm -rf .git # remove my git you can use yours.
stow nvim # Everything except .gitignore, .git folder, adn etc.
```

# My Dotfiles 👑

This is my configuaration in linux and macOS for daily usage.

- **Operating System 💻**: Archlinux, MacOS
- **Window Manager 🪟**: Hyprland
- **Shell 🌟**: Zsh with Zap and Starship
- **Terminal**: kitty
- **Git GUI ☑️**: lazygit
- **Topbar 💈**: Waybar
- **App Launcher 🚗**: Rofi
- **File Manager 💼**: Thunar
- **Editor 📰**: Neovim, Vscode

## Screenshot

![Alt text](./.assets/screenshots/screenshot-float.png?raw=true)
![Alt text](./.assets/screenshots/screenshot-tile.png?raw=true)

## Requirements

- paru : AUR for archlinux.
- Homebrew : package manager for macOS.
- stow(optional) : for quick setup the dotfiles.

```bash
paru stow # for Archlinux
brew install stow # for macOS
```

- Zap : zsh plugin manager

```zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
```

- Starship

```zsh
paru starship # for Archlinux
brew install starship
```

## Installation

Copy the following command in your terminal.

### Add hyprland and others

```bash
git clone --recursive https://github.com/Liam-Lin0107/dotfiles.git ~/dotfiles
cd ~/dotfiles
rm -rf .git # remove my git you can use yours.
paru -S --needed - < packages.txt
stow --ignore=".git, .assets, .gitignore, .gitmodules, .package, README.md" */ # Everything except .gitignore, .git folder, and etc.
```

### Add sddm theme

```bash
# add sddm theme
sudo cp -r ./.assets/sddm-themes/sugar-candy /usr/share/sddm/themes/
# them create a directory in /etc/sddm.conf.d if not exist
sudo cp -r ./.assets/sddm-themes/10-theme.conf /etc/sddm.conf.d

```

### Add only neovim setting

```bash
git clone --recursive https://github.com/Liam-Lin0107/nvim.git ~/.config/nvim
cd ~/dotfiles
rm -rf .git # remove my git you can use yours.
stow nvim # only nvim.
```

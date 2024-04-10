# My dotfiles
This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system

### Zsh
```
sudo apt update && sudo apt install -y zsh
```
Set zsh as default shell
```
sudo chsh -s $(which zsh)
```
Check shell
```
echo $SHELL
```

### Git
```
sudo apt install git
```

### Stow
```
sudo apt install stow
```

### Tmux
```
sudo apt install tmux && \
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation
First, check out the dotfiles repo in your $HOME directory using git
```
git clone https://github.com/mdondukov/dotfiles.git && \
cd dotfiles
```
then use GNU stow to create symlinks
```
stow .
```
in $HOME update zsh
```
source .zshrc
```

## Post Installation

### Neovim
External Requirements
```
sudo apt install make unzip gcc ripgrep
```
Install Neovim
```
sudo add-apt-repository ppa:neovim-ppa/unstable && \
sudo apt-get update && \
sudo apt-get install neovim
```
Install kickstart
```
git clone https://github.com/mdondukov/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```
Start Neovim
```
nvim
```

### Fzf
```
sudo apt install fzf
```

### SDKMan
External Requirements
```
sudo apt install zip curl
```
Install SDKMan
```
curl -s "https://get.sdkman.io" | \
bash && source "$HOME/.sdkman/bin/sdkman-init.sh" --no-modify-profile
```

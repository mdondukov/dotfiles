# My dotfiles
This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system

### Zsh
```
sudo apt update && sudo apt install -y zsh && sudo chsh -s $(which zsh)
```

### Git, Curl, Stow
```
sudo apt update && sudo apt install git curl stow
```

### Vim
```
sudo apt install vim && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
mkdir -p ~/.vim/plugged/onedark.vim && git clone https://github.com/joshdick/onedark.vim.git ~/.vim/plugged/onedark.vim && \
mkdir -p ~/.vim/colors && cp ~/.vim/plugged/onedark.vim/colors/onedark.vim ~/.vim/colors/ && \
cp ~/.vim/plugged/onedark.vim/autoload/onedark.vim ~/.vim/autoload/
mkdir -p ~/.vim/autoload/lightline/colorscheme && cp ~/.vim/plugged/onedark.vim/autoload/lightline/colorscheme/onedark.vim ~/.vim/autoload/lightline/colorscheme/
```

### Tmux
```
sudo apt install tmux && \
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Install
First, check out the dotfiles repo in your $HOME directory using git
```
$ git clone https://github.com/mdondukov/dotfiles.git
$ cd dotfiles
```
then use GNU stow to create symlinks
```
$ stow --adopt .
```
in $HOME update zsh
```
$ source .zshrc
```
open vim and install plugins
```
:PlugInstall
```

## Post-install

### Zip
```
sudo apt update && sudo apt install zip
```

### SDKMAN!
```
curl -s "https://get.sdkman.io" | bash && source "$HOME/.sdkman/bin/sdkman-init.sh" --no-modify-profile
```

# My dotfiles
This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system

```
apt update && apt install -y zsh && chsh -s $(which zsh)
```
```
apt update && apt install git curl zip stow
```

### Starship
```
apt install fonts-firacode && curl -fsSL https://starship.rs/install.sh | sh
```

### Vim
```
apt install vim && \
mkdir -p ~/tmp/onedark.vim && git clone https://github.com/joshdick/onedark.vim.git ~/tmp/onedark.vim && \
mkdir -p ~/.vim/colors && cp ~/tmp/onedark.vim/colors/onedark.vim ~/.vim/colors/ && \
mkdir -p ~/.vim/autoload && cp ~/tmp/onedark.vim/autoload/onedark.vim ~/.vim/autoload/
mkdir -p ~/.vim/autoload/lightline/colorscheme && cp ~/tmp/onedark.vim/autoload/lightline/colorscheme/onedark.vim ~/.vim/autoload/lightline/colorscheme/
```

## Install
First, check out the dotfiles repo in your $HOME directory using git
```
$ git clone https://github.com/mdondukov/dotfiles.git
$ cd dotfiles
$ git checkout ubuntu
```
then use GNU stow to create symlinks
```
$ stow --adopt .
```

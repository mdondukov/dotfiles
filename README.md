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

### SDKMAN!
```
curl -s "https://get.sdkman.io" | bash && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

### Starship
```
apt install fonts-firacode && curl -fsSL https://starship.rs/install.sh | sh
```

### Vim
```
apt install vim && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
mkdir -p ~/.vim/plugged/onedark.vim && git clone https://raw.githubusercontent.com/joshdick/onedark.vim.git ~/.vim/plugged/onedark.vim && \
mkdir -p ~/.vim/colors && cp ~/.vim/plugged/onedark.vim/colors/onedark.vim ~/.vim/colors/ && \
cp ~/.vim/plugged/onedark.vim/autoload/onedark.vim ~/.vim/autoload/
mkdir -p ~/.vim/autoload/lightline/colorscheme && cp ~/.vim/plugged/onedark.vim/autoload/lightline/colorscheme/onedark.vim ~/.vim/autoload/lightline/colorscheme/
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
$ stow .
```

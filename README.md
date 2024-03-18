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

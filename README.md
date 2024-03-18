# My dotfiles
This directory contains the dotfiles for my system

## Requirements
Ensure you have the following installed on your system

### Git
```
sudo apt update
sudo apt install git
```

### Stow
```
sudo apt update
sudo apt install stow
```

### Curl
```
sudo apt update
sudo apt install curl
```

### Starship
```
sudo apt update
sudo apt install fonts-firacode
curl -fsSL https://starship.rs/install.sh | bash
```

### SDKMAN!
```
curl -s "https://get.sdkman.io" | bash
```

## Install
First, check out the dotfiles repo in your $HOME directory using git
```
$ git clone git@github.com/mdondukov/dotfiles.git
$ cd dotfiles
$ git checkout ubuntu
```
then use GNU stow to create symlinks
```
$ stow .
```

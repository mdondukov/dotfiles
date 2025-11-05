# My dotfiles (macOS)

This directory contains the dotfiles for my macOS system.

## Requirements

### Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Zsh
Zsh comes pre-installed on macOS. Make sure it's your default shell:
```bash
chsh -s $(which zsh)
```

### Git
```bash
brew install git
```

### Stow
```bash
brew install stow
```

## Installation

1. Clone the dotfiles repo in your $HOME directory:
```bash
git clone https://github.com/mdondukov/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Use GNU stow to create symlinks:
```bash
stow .
```

3. Reload your shell:
```bash
source ~/.zshrc
```

## Post Installation

### Zinit
Zinit will be automatically installed on first shell start if not present. If you need to install it manually:
```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

### Powerlevel10k
On first run, you'll be prompted to configure Powerlevel10k. To reconfigure later:
```bash
p10k configure
```

### FZF
```bash
brew install fzf
$(brew --prefix)/opt/fzf/install
```

### Zoxide
```bash
brew install zoxide
```

### NVM (Node Version Manager)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

### SDKMan
```bash
curl -s "https://get.sdkman.io" | bash
```

### Neovim
If you want to use Neovim with your config:
```bash
brew install neovim ripgrep
```

## Updating

To pull the latest changes:
```bash
cd ~/dotfiles
git pull
```

## Notes

- Old Linux-based configuration is archived in the `archive-linux-2024` branch
- The `.zshrc` includes zinit for plugin management
- Powerlevel10k configuration is stored in `~/.p10k.zsh` (not tracked in this repo)

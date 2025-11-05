# My dotfiles (macOS)

This directory contains the dotfiles for my macOS system.

## Requirements

### Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Git
If not already installed:
```bash
brew install git
```

## Installation

### Quick Start (Recommended)

1. Clone the dotfiles repo:
```bash
git clone https://github.com/mdondukov/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Install all packages and applications via Brewfile:
```bash
brew bundle
```

This will install:
- CLI tools (fzf, zoxide, neovim, etc.)
- Development tools (kubectl, tig, stow)
- Programming languages (Python, Kotlin, Go tooling)
- GUI applications (ghostty, wezterm, codex)
- Fonts (Nerd Fonts)
- Go development packages for Neovim

3. Create symlinks with Stow:
```bash
stow .
```

4. Reload your shell:
```bash
source ~/.zshrc
```

### Manual Installation

If you prefer to install packages manually, check the `Brewfile` for the complete list of packages.

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
Complete the FZF installation with shell integration:
```bash
$(brew --prefix)/opt/fzf/install
```

### Optional: NVM (Node Version Manager)
If you need Node.js:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

### Optional: SDKMan
If you need Java/Kotlin SDK management:
```bash
curl -s "https://get.sdkman.io" | bash
```

## Updating

To pull the latest changes:
```bash
cd ~/dotfiles
git pull
```

## Managing Packages

### Update installed packages
```bash
cd ~/dotfiles
brew bundle
```

### Generate new Brewfile (snapshot current system)
```bash
cd ~/dotfiles
brew bundle dump --force --describe
```

### Check what would be installed
```bash
cd ~/dotfiles
brew bundle check
```

## Optional: Neovim Configuration

I use a fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) for my Neovim configuration. It's maintained in a separate repository to keep the dotfiles flexible.

If you want to use my Neovim configuration:

```bash
git clone -b dev https://github.com/mdondukov/kickstart.nvim.git ~/.config/nvim
```

> **Note:** This is completely optional. Feel free to use your own Neovim configuration or skip this step entirely.

## Notes

- Old Linux-based configuration is archived in the `archive-linux-2024` branch
- The `.zshrc` includes zinit for plugin management
- Powerlevel10k configuration is stored in `~/.p10k.zsh` (not tracked in this repo)
- All packages are managed via `Brewfile` for easy reproducibility
- Neovim configuration is kept separate for flexibility - see "Optional: Neovim Configuration" section

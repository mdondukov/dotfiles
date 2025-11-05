# dotfiles

My personal macOS development environment configuration.

## Contents

This repository contains configuration for:

- **Shell environment**: `zsh` with `zinit` plugin manager and `powerlevel10k` prompt
- **Terminal emulators**: `ghostty` and `wezterm` configurations
- **Package management**: `Brewfile` for reproducible system setup
- **Dotfile management**: GNU `stow` for symlink management

## Philosophy

These dotfiles follow several key principles:

- **Minimalism**: Only include what I actually use
- **Modularity**: Keep configurations separate and optional (e.g., Neovim config is not included)
- **Reproducibility**: Use `Brewfile` to declare all dependencies explicitly
- **Public by default**: Share configurations that might help others, without forcing my entire setup

My Neovim configuration is maintained separately at [mdondukov/kickstart.nvim](https://github.com/mdondukov/kickstart.nvim) to keep it independent and allow others to use their own editor setup.

## Installation

### Prerequisites

Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Setup

Clone this repository:

```bash
git clone https://github.com/mdondukov/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install all packages and applications:

```bash
brew bundle
```

This installs:
- CLI tools: `fzf`, `zoxide`, `neovim`, `git`, `curl`
- Development tools: `kubectl`, `tig`, `stow`
- Programming languages: Python 3.13, Kotlin, Go tooling
- Terminal emulators: `ghostty`, `wezterm`
- Fonts: JetBrains Mono Nerd Font, Meslo LG Nerd Font

Create symlinks using Stow:

```bash
stow .
```

Reload your shell:

```bash
source ~/.zshrc
```

## Shell

I use `zsh` with [`zinit`](https://github.com/zdharma-continuum/zinit) for fast plugin loading.

### Features

- **Prompt**: [`powerlevel10k`](https://github.com/romkatv/powerlevel10k) - fast and customizable prompt
- **Fuzzy finding**: [`fzf`](https://github.com/junegunn/fzf) - command-line fuzzy finder
- **Smart navigation**: [`zoxide`](https://github.com/ajeetdsouza/zoxide) - smarter `cd` command
- **Syntax highlighting**: [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- **Autosuggestions**: [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)

### Plugins

Oh My Zsh plugins loaded via zinit snippets:
- `git` - Git aliases and functions
- `tig` - Git TUI integration
- `docker` and `docker-compose` - Docker completions
- `kubectl` and `kubectx` - Kubernetes tooling
- `sudo` - Press ESC twice to prefix command with sudo

### First run setup

On first shell start, `zinit` will be automatically installed. You'll also be prompted to configure `powerlevel10k`:

```bash
p10k configure
```

Complete the FZF installation with shell integration:

```bash
$(brew --prefix)/opt/fzf/install
```

## Terminal

I use two GPU-accelerated terminal emulators:

### Ghostty

Modern, native macOS terminal with minimal configuration:

```
theme = GitHub Dark Default
font-family = "JetBrainsMono Nerd Font"
font-size = 17.0
cursor-style = bar
```

### WezTerm

Cross-platform GPU terminal with multiplexer capabilities:

- Color scheme: GitHub Dark
- Font: JetBrainsMono Nerd Font with ligatures
- WebGPU rendering backend
- macOS window blur effect

## Editor

I use Neovim with a fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).

This configuration is **not included** in this repository to keep the dotfiles flexible. Install it separately if you want:

```bash
git clone -b dev https://github.com/mdondukov/kickstart.nvim.git ~/.config/nvim
```

## Optional tools

### NVM (Node Version Manager)

For Node.js development:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

### SDKMan

For Java/Kotlin SDK management:

```bash
curl -s "https://get.sdkman.io" | bash
```

Both tools are loaded in `.zshrc` if present.

## Managing packages

### Update all packages

```bash
cd ~/dotfiles
brew bundle
```

### Generate new Brewfile

Capture current system state:

```bash
cd ~/dotfiles
brew bundle dump --force --describe
```

### Check what would be installed

```bash
cd ~/dotfiles
brew bundle check
```

## Updating

Pull the latest changes:

```bash
cd ~/dotfiles
git pull
```

Since dotfiles are symlinked via Stow, changes take effect immediately.

## Local customization

The `.zshrc` sources local files if they exist:

- `~/.shell_env_local` - Local environment variables
- `~/.p10k.zsh` - Powerlevel10k configuration (generated, not tracked)

## Notes

- Old Linux-based configuration is archived in the `archive-linux-2024` branch
- Powerlevel10k configuration is machine-specific and not tracked
- All system packages are declared in `Brewfile` for reproducibility
- Neovim configuration is maintained separately for flexibility

## License

MIT

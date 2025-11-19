# dotfiles (server)

Lightweight server configuration optimized for performance with GitHub Dark theme.

## Contents

This repository contains configuration for:

- **Shell environment**: `zsh` with `zinit` plugin manager and minimal plugins
- **Terminal multiplexer**: `tmux` with GitHub Dark theme and vim-style navigation
- **Text editor**: `vim` with GitHub Dark colorscheme and OSC 52 clipboard support
- **Dotfile management**: GNU `stow` for symlink management

## Installation

### Prerequisites

Install required packages:

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y zsh git stow tmux vim curl

# CentOS/RHEL
sudo yum install -y zsh git stow tmux vim curl

# Alpine
apk add zsh git stow tmux vim curl
```

Set zsh as default shell:

```bash
chsh -s $(which zsh)
```

### Setup

Clone this repository on the `linux-server` branch:

```bash
git clone -b linux-server https://github.com/mdondukov/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Create symlinks using Stow:

```bash
stow .
```

The repo includes `.stow-local-ignore`, so running `stow .` safely skips repository metadata (`.git`, `README.md`, etc.) and only symlinks configuration files.

Reload your shell:

```bash
source ~/.zshrc
```

Zinit will automatically install plugins on first run.

Start tmux and reload configuration:

```bash
tmux
# Inside tmux: Ctrl+a r
```

Launch Vim to install plugins:

```bash
vim
# First run will install vim-plug and GitHub Dark theme (~5-10 seconds)
# Subsequent launches are instant
```

## Optional tools

### FZF (Fuzzy Finder)

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

When prompted:
- Enable fuzzy auto-completion: Yes
- Enable key bindings: Yes
- Update shell configuration files: No (already configured in .zshrc)

### SDKMAN (JVM Version Manager)

```bash
# Ubuntu/Debian
sudo apt install -y zip

# CentOS/RHEL
sudo yum install -y zip

# Alpine
apk add zip

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

### Docker

```bash
# Ubuntu/Debian
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
```

## Tmux prefix

Default prefix key is `Ctrl+a`.

## Branches

- `master` - macOS/desktop configuration
- `linux-server` - lightweight server configuration (current)

## License

MIT

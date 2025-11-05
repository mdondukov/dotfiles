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
- **Smart navigation**: [`zoxide`](https://github.com/ajeetdsouza/zoxide) - smarter `cd` command
- **Syntax highlighting**: [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting)
- **Autosuggestions**: [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions)

### FZF - Fuzzy Finder

[`fzf`](https://github.com/junegunn/fzf) is a game-changer for command-line productivity. It's a general-purpose fuzzy finder that integrates into shell workflows.

Key capabilities:
- **History search**: `Ctrl-R` for interactive command history with preview
- **File navigation**: `Ctrl-T` to fuzzy-find files in current directory
- **Directory jumping**: `Alt-C` to quickly change directories
- **Git integration**: Fuzzy-find branches, commits, and files in git repos
- **Any list filtering**: Pipe any output to `fzf` for interactive selection

Example workflow:
```bash
# Find and edit a file
vim $(fzf)

# Kill a process interactively
kill -9 $(ps aux | fzf | awk '{print $2}')

# Checkout a git branch
git checkout $(git branch | fzf)
```

If you're not using fzf yet, install it - it will change how you work in the terminal.

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

## Color scheme

I use [GitHub Dark](https://github.com/projekt0n/github-nvim-theme) theme consistently across all tools: terminals, Neovim, and VS Code (when needed).

This provides several benefits:
- **Consistency**: Same colors everywhere reduce cognitive load
- **GitHub integration**: Matches GitHub's UI, making code reviews and PR navigation seamless
- **Well-designed**: Carefully crafted color palette optimized for readability
- **Maintained**: Part of GitHub's design system, stays up-to-date

The muscle memory of seeing code in the same colors locally and on GitHub speeds up development and code review workflows.

## Terminal

I use two GPU-accelerated terminal emulators, both configured with GitHub Dark theme:

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

I use [Neovim](https://neovim.io/) as my primary editor. Not an IDE - an editor.

### Why Neovim over IDEs?

**Philosophy**: I don't need an IDE. I need a great editor that follows Unix philosophy - do one thing well. Neovim excels at editing text, and I compose it with other Unix tools (grep, find, git, etc.) to build my development environment.

**Freedom**: With Neovim and plugins like Telescope, LSP, and Treesitter, I get:
- Blazing fast fuzzy finding across files, buffers, and grep results
- Language server protocol support for any language
- Precise text manipulation with vim motions
- Complete control over my environment
- No vendor lock-in or proprietary formats

**Customization**: Every keybinding, every behavior, every feature is under my control. The editor adapts to my workflow, not the other way around.

### Why Kickstart?

I use [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) as a foundation because:
- **Minimal but complete**: Good defaults without bloat
- **Educational**: Well-commented configuration teaches Neovim concepts
- **Starting point**: Easy to understand and extend with custom configurations
- **Maintained**: Stays up-to-date with Neovim best practices

My fork at [mdondukov/kickstart.nvim](https://github.com/mdondukov/kickstart.nvim) includes my personal customizations on top of kickstart's solid foundation.

### Installation

This configuration is **not included** in this repository to keep the dotfiles flexible. Install it separately if you want:

```bash
git clone -b dev https://github.com/mdondukov/kickstart.nvim.git ~/.config/nvim
```

Both Neovim and kickstart are configured with GitHub Dark theme for consistency.

## Optional tools

### NVM (Node Version Manager)

For Node.js development:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```

### SDKMan

[SDKMan](https://sdkman.io/) is essential for JVM development (Java, Kotlin, Scala, Groovy).

**Why it's crucial**: Different projects often require different JVM versions. SDKMan makes it trivial to:
- Install and switch between multiple Java versions (8, 11, 17, 21, etc.)
- Manage build tools (Gradle, Maven) per-project
- Install JVM languages (Kotlin, Scala) and tools
- Use different versions in different terminal sessions

Example workflow:
```bash
# Install Java 21
sdk install java 21.0.1-tem

# Install Java 17 for older projects
sdk install java 17.0.9-tem

# Switch Java version in current shell
sdk use java 17.0.9-tem

# Set default Java version
sdk default java 21.0.1-tem

# Install Gradle
sdk install gradle 8.5
```

This solves the "works on my machine" problem when different projects require different JVM tooling.

Installation:
```bash
curl -s "https://get.sdkman.io" | bash
```

Both NVM and SDKMan are loaded in `.zshrc` if present.

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

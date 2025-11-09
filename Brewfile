# Brewfile for macOS development environment
# Install with: brew bundle

# ============================================================================
# Taps
# ============================================================================
tap "wez/wezterm"

# ============================================================================
# CLI Tools
# ============================================================================

# Essential CLI utilities
brew "curl"                    # HTTP client
brew "fzf"                     # Fuzzy finder (used in .zshrc)
brew "git"                     # Version control (newer than macOS default)
brew "ripgrep"                 # Fast search tool (used in Neovim)
brew "zoxide"                  # Smart directory navigation (used in .zshrc)
brew "zip"                     # Archive utility

# ============================================================================
# Development Tools
# ============================================================================

# Editor and Git UI
brew "neovim"                  # Main text editor
brew "tig"                     # Git terminal UI (used in .zshrc)
brew "stow"                    # Dotfiles management

# Kubernetes
brew "kubernetes-cli"          # kubectl (used in .zshrc)

# ============================================================================
# Programming Languages & Tools
# ============================================================================

# Python
brew "python"                  # Latest stable Python from Homebrew
brew "poetry"                  # Python dependency management
brew "uv"                      # Fast Python package installer

# Kotlin
brew "kotlin"                  # Kotlin language

# Go
brew "go"                      # Go toolchain required for go_install entries
brew "golangci-lint"           # Go linter

# ============================================================================
# Utilities
# ============================================================================

brew "graphviz"                # Graph visualization
brew "imagemagick"             # Image manipulation
brew "plantuml"                # UML diagrams

# ============================================================================
# GUI Applications (Casks)
# ============================================================================

# Terminals
cask "ghostty"                 # Modern GPU-accelerated terminal
cask "wezterm"                 # GPU terminal with multiplexer

# Development
cask "codex"                   # OpenAI coding agent

# Fonts
cask "font-jetbrains-mono-nerd-font"
cask "font-meslo-lg-nerd-font"

# ============================================================================
# Go Development Tools (for Neovim)
# ============================================================================

go "golang.org/x/tools/cmd/callgraph"
go "github.com/go-delve/delve/cmd/dlv"
go "github.com/davidrjenni/reftools/cmd/fillswitch"
go "github.com/onsi/ginkgo/v2/ginkgo"
go "github.com/abice/go-enum"
go "mvdan.cc/gofumpt"
go "golang.org/x/tools/cmd/goimports"
go "github.com/twpayne/go-jsonstruct/v3/cmd/gojsonstruct"
go "github.com/golangci/golangci-lint/v2/cmd/golangci-lint"
go "github.com/segmentio/golines"
go "github.com/fatih/gomodifytags"
go "github.com/abenz1267/gomvp"
go "golang.org/x/tools/cmd/gonew"
go "golang.org/x/tools/gopls"
go "github.com/cweill/gotests/gotests"
go "gotest.tools/gotestsum"
go "golang.org/x/vuln/cmd/govulncheck"
go "github.com/koron/iferr"
go "github.com/josharian/impl"
go "github.com/tmc/json-to-struct"
go "go.uber.org/mock/mockgen"
go "github.com/kyoh86/richgo"
go "honnef.co/go/tools/cmd/staticcheck"

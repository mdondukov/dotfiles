# ============================================
# Lightweight Server ZSH Configuration
# GitHub Dark Theme
# ============================================

# Basic completions
autoload -Uz compinit && compinit

# Aliases
alias dc='docker compose'

# Tree fallback (if tree is not installed)
if ! command -v tree &> /dev/null; then
    alias tree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g"'
fi

# ============================================
# Zinit Plugin Manager
# ============================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# ============================================
# Lightweight Plugins (no full oh-my-zsh)
# ============================================
zinit snippet OMZP::git
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::sudo

# Autosuggestions (lightweight and useful)
zinit light zsh-users/zsh-autosuggestions

# ============================================
# GitHub Dark Theme Prompt
# ============================================
# Colors based on GitHub Dark theme:
# Background: #0d1117, Text: #c9d1d9
# Blue: #58a6ff, Green: #3fb950, Red: #f85149, Yellow: #d29922

# Enable colors
autoload -U colors && colors

# Git branch helper
function git_branch() {
    git branch 2>/dev/null | grep '^*' | colorkind
}

# Two-line prompt with GitHub Dark colors
setopt PROMPT_SUBST
PROMPT='%F{#58a6ff}%n@%m%f %F{#3fb950}%~%f %F{#d29922}$(git branch 2>/dev/null | grep "^\*" | cut -d " " -f2)%f
%(?,%F{#3fb950}➜%f,%F{#f85149}➜%f) '

# Right prompt with time
RPROMPT='%F{#8b949e}[%*]%f'

# ============================================
# ZSH Autosuggestions Configuration
# ============================================
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8b949e'

# ============================================
# FZF Integration
# ============================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF GitHub Dark colors
export FZF_DEFAULT_OPTS="
  --color=bg+:#161b22,bg:#0d1117,spinner:#3fb950,hl:#58a6ff
  --color=fg:#c9d1d9,header:#58a6ff,info:#d29922,pointer:#f85149
  --color=marker:#3fb950,fg+:#c9d1d9,prompt:#58a6ff,hl+:#58a6ff
"

# ============================================
# SDKMAN (Java/JVM version manager)
# THIS MUST BE AT THE END FOR SDKMAN TO WORK
# ============================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

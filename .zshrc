# Minimal Server ZSH Configuration

# Completions
autoload -Uz compinit && compinit

# Simple prompt (no git, fast)
PROMPT='%F{cyan}%n@%m%f %F{green}%~%f
%(?,%F{green}➜%f,%F{red}➜%f) '

# Aliases
alias dc='docker compose'
alias ll='ls -lah'

# Tree fallback
if ! command -v tree &> /dev/null; then
    alias tree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g"'
fi

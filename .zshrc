if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD

# Enable vi mode for command line editing
bindkey -v

export HOMEBREW_NO_AUTO_UPDATE=1

source ~/.zinit/bin/zinit.zsh

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit snippet OMZP::git
zinit snippet OMZP::tig
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

if command -v docker &>/dev/null; then
  source <(docker completion zsh)
fi

alias vim='nvim'
alias k='kubectl'
alias d='docker'
alias ll='ls -lah'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source ~/.sdkman/bin/sdkman-init.sh

fpath=(/Users/max/.docker/completions $fpath)
autoload -Uz compinit
compinit

alias claude="/Users/max/.claude/local/claude"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

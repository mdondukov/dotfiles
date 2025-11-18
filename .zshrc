# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Минималистичный prompt без powerlevel10k
#PROMPT='%n@%m %1~ %# '

# История и удобства
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD

# Подключаем zinit (предполагается, что он уже установлен)
source ~/.zinit/bin/zinit.zsh

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit snippet OMZP::git
zinit snippet OMZP::tig
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::sudo

# Homebrew command-not-found handler (for macOS)
if command -v brew &>/dev/null; then
  export HOMEBREW_NO_AUTO_UPDATE=1
  eval "$(brew command-not-found-init)"
fi

# Лёгкие и полезные плагины
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Zoxide
eval "$(zoxide init zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Автодополнение
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Поддержка автодополнения kubectl и docker (если что-то не хватает)
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

if command -v docker &>/dev/null; then
  source <(docker completion zsh)
fi

# Alias'ы
alias vim='nvim'
alias k='kubectl'
alias d='docker'
alias ll='ls -lah'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.sdkman/bin/sdkman-init.sh

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/max/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

alias claude="/Users/max/.claude/local/claude"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

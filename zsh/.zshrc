# ZSH Configuration
# Author: Alex Schofield

# Git Alias
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gpl='git pull'
alias gpu='git push'
alias gl='git log --oneline --graph --decorate'
alias glg="git log --graph --pretty=format:'%C(bold blue)%h%Creset - %C(white)%s%Creset %C(dim white)- %an, %ar%Creset' --abbrev-commit"

# Other Alias
alias grep="grep --color=always"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt extended_history

# Path
export PATH=$PATH:~/.local/bin

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.omp_themes/cloud-context.omp.json)"

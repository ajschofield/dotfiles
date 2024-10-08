eval "$(oh-my-posh init zsh --config ~/.omp_themes/tiwahu.omp.json)"
export PATH=$HOME/.local/bin:$PATH
source <(fzf --zsh)
eval $(thefuck --alias)

# Antigen Stuff

source $HOME/antigen.zsh

# load plugins
antigen bundle git
antigen bundle node
antigen bundle npm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle fdellwing/zsh-bat

antigen apply

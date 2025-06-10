# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    nvm
)

source $ZSH/oh-my-zsh.sh

# User configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias gcz="cz"
# alias protontricks='flatpak run com.github.Matoking.protontricks'
# alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'
alias python='python3'

# Set name of the theme to load
eval "$(starship init zsh)"
export PATH=$HOME/.local/bin:$PATH

alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'
alias spotify='spotify_player'
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin/

# pnpm
export PNPM_HOME="/home/stinodes/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

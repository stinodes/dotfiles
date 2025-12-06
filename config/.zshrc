# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export STN_HOME=$HOME/.config/stn
. $STN_HOME/bin/stn-set-env
export PATH=$PATH:$STN_BIN


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
alias nv='nvim'
alias nvd='nvim .'
alias vpnup='sudo wg-quick up be31'
alias vpndown='sudo wg-quick down be31'
alias vpnstatus='sudo wg'
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin/
export SNACKS_GHOSTTY=true

# pnpm
export PNPM_HOME=$HOME/.local/share/pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


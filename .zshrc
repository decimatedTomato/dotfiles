# Only run for interactive shells
case $- in
	*i*) ;;
	*) return;;
esac
########################### ENVIRONMENT VARIABLES ##############################
export HISTSIZE=100000
export SAVEHIST=100000
export LESS='-R -j 2 --mouse --wheel-lines 2'
export EDITOR=vim
################################### SETTINGS ###################################
setopt EXTENDED_HISTORY
################################################################################

source ~/.alias
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash
[ -f ~/git/fzf-git/fzf-git.sh ]  && source ~/git/fzf-git/fzf-git.sh

[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
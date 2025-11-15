########################### ENVIRONMENT VARIABLES ##############################
export HISTSIZE=-1
export HISTFILESIZE=-1
export LESS='-j 2 --mouse --wheel-lines 2'
############################## SHELL VARIABLES #################################
EDITOR=vim
################################### SETTINGS ###################################
shopt -s histappend
################################### ALIASES ####################################
alias brc='$EDITOR ~/.bashrc && source ~/.bashrc'
alias zrc='$EDITOR ~/.zshrc && source ~/.zshrc'
alias vrc='$EDITOR ~/.vimrc'
alias gcfg='$EDITOR ~/.gitconfig'
alias tcfg='$EDITOR ~/.tmux.conf && tmux source-file ~/.tmux.conf'

alias gs='git status'
alias gd='git diff HEAD'
alias gb='git branch'
alias gl='git log --pretty=oneline'

alias ll="ls -l"
alias la="ls -al"

alias py="python3"
alias python="python3"
alias v='source ./venv/bin/activate'
alias vv='python -m venv venv && v'

alias cmake_grep='grep -r --exclude-dir build --include '*.cmake' --include 'CMakeLists.txt''

################################################################################

[ -f ~/.bashrc_local ] && source ~/.bashrc_local

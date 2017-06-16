export ZSH=/home/thiago/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Docker Alias
alias dk='docker'
alias dkc='docker-compose'

# Atom Alias
alias atompkg='apm list --installed --bare > packages.txt'
alias atominstall='apm install --packages-file packages.txt'

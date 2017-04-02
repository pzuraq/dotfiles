source ~/.dotfiles/zsh/zplug.zsh

alias glog="git log --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

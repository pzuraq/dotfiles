source ~/.dotfiles/zsh/zplug.zsh

alias gci="git commit"
alias gco="git checkout"
alias gbr="git branch"
alias gst="git status"
alias gdel="git branch -D"
alias glog="git log --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph"

alias git-clean-local="git branch -r | sed -n -e 's/origin\///p' | awk '{ print $1 }' | cat < <(git rev-parse --abbrev-ref HEAD) | egrep -v -f /dev/fd/0 <(git branch) | awk '{print $1}' | xargs git branch -D"
alias load_db='./Tools/scripts/fetch_remote_db.sh --ldap-username chris.garrett --fetch-db --no-backup-db'

# ulimit -n 65536 65536

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Seems to fix VSCode issue for now

# source ~/.zshrc_local
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/pzuraq/Code/pzuraq/tewdew/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/pzuraq/Code/pzuraq/tewdew/node_modules/tabtab/.completions/electron-forge.zsh
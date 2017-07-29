source ~/.dotfiles/zsh/zplug.zsh

alias glog="git log --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph"
alias git-clean-local="git branch -r | sed -n -e 's/origin\///p' | awk '{ print $1 }' | cat < <(git rev-parse --abbrev-ref HEAD) | egrep -v -f /dev/fd/0 <(git branch) | awk '{print $1}' | xargs git branch -D"
alias load_db='./Tools/scripts/fetch_remote_db.sh --ldap-username chris.garrett --fetch-db --no-backup-db'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.dotfiles/zsh/zplug.zsh

alias gci="git commit"
alias gco="git checkout"
alias gbr="git branch"
alias gst="git status"
alias gdel="git branch -D"
alias glog="git log --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph"

alias git-clean-local="git branch -r | sed -n -e 's/origin\///p' | awk '{ print $1 }' | cat < <(git rev-parse --abbrev-ref HEAD) | egrep -v -f /dev/fd/0 <(git branch) | awk '{print $1}' | xargs git branch -D"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.dotfiles/scripts"

export NOTION_HOME="$HOME/.notion"
[ -s "$NOTION_HOME/load.sh" ] && \. "$NOTION_HOME/load.sh"

export PATH="${NOTION_HOME}/bin:$PATH"

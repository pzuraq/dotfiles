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

export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias chrome="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

export NODE_OPTIONS="--max-old-space-size=8192"

export GITHUB_AUTH="3f8a693d63739b81b88f6d7912f6618fc922fcb2"
export GITHUB_TOKEN="3f8a693d63739b81b88f6d7912f6618fc922fcb2"

export EDITOR="code --wait --new-window"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

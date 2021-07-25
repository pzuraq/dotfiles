# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias git-clean-local="git branch -r | sed -n -e 's/origin\///p' | awk '{ print $1 }' | cat < <(git rev-parse --abbrev-ref HEAD) | egrep -v -f /dev/fd/0 <(git branch) | awk '{print $1}' | xargs git branch -D"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.dotfiles/scripts"

export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NODE_OPTIONS="--max-old-space-size=8192"

export EDITOR="code --wait --new-window"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

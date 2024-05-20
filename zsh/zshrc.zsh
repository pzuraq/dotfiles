# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Brew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Customize to your needs...

alias git-clean-local="git branch -r | sed -n -e 's/origin\///p' | awk '{ print $1 }' | cat < <(git rev-parse --abbrev-ref HEAD) | egrep -v -f /dev/fd/0 <(git branch) | awk '{print $1}' | xargs git branch -D"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.dotfiles/scripts"

export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NODE_OPTIONS="--max-old-space-size=8192"

export EDITOR="code --wait --new-window"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Notes path
export NOTES_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes"

# Add local config not checked into VCS
source "$HOME/.profile"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

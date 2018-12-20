#!/bin/sh
cd $HOME
mkdir -p "$HOME/Code"

dotfiles="$HOME/.dotfiles"

if [ ! -d $dotfiles ]
then
  git clone https://github.com/pzuraq/dotfiles.git .dotfiles
fi

notion_dir="$HOME/.notion"
# Install Notion
if [ ! -d $notion_dir ]
then
  echo "  Installing Notion for you."

  touch $notion_dir
  curl -sSLf https://get.notionjs.com | bash
fi

# Install Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

  # Update Homebrew recipes
  brew update

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
fi

# Install dependencies
brew bundle --file="$dotfiles/Brewfile"

xcode-select --install

# Make sure ZSH is the default shell environment
if [ ! -n "$ZSH_VERSION" ]; then
  command -v zsh | sudo tee -a /etc/shells
  chsh -s "$(command -v zsh)"
fi

sh "$dotfiles/link.sh"
sh "$dotfiles/macos.sh"

exit 0

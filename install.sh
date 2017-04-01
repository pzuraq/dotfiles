#!/bin/sh
cd $HOME
mkdir -p "$HOME/Code"

dotfiles="$HOME/.dotfiles"

if [ ! -d $dotfiles ]
then
  git clone git://github.com/pzuraq/dotfiles.git .dotfiles
fi

# Install NVM
if test ! $(which nvm)
then
  echo "  Installing NVM for you."

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
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

# Make sure ZSH is the default shell environment
if [ ! -n "$ZSH_VERSION" ]; then
  command -v zsh | sudo tee -a /etc/shells
  sudo chsh -s "$(command -v zsh)"
fi

sh "$dotfiles/macos.sh"
sh "$dotfiles/link.sh"

exit 0

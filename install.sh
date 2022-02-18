#!/bin/sh
cd $HOME
mkdir -p "$HOME/Code"

dotfiles="$HOME/.dotfiles"

xcode-select --install

if [ ! -d $dotfiles ]
then
  git clone https://github.com/pzuraq/dotfiles.git .dotfiles
fi

volta_dir="$HOME/.volta"
# Install Volta
if [ ! -d $volta_dir ]
then
  echo "  Installing Volta for you."

  mkdir $volta_dir
  curl https://get.volta.sh | bash
fi

prezto_dir="${ZDOTDIR:-$HOME}/.zprezto"
# Install Prezto
if [ ! -d $prezto_dir ]
then
  echo "  Installing Prezto for you."

  git clone --recursive https://github.com/sorin-ionescu/prezto.git

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
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

sh "$dotfiles/link.sh"

exit 0

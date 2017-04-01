#!/bin/bash

dotfiles="$HOME/.dotfiles"

link() {
  from="$dotfiles/$1"
  to="$HOME/$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

# link files

link "git/gitconfig" ".gitconfig"
link "git/gitignore" ".gitignore"

link "karabiner/karabiner.json" ".config/karabiner/karabiner.json"

link "zsh/zshrc.zsh" ".zshrc"

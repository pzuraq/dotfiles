#!/bin/bash

dotfiles="$HOME/.dotfiles"

link() {
  from="$dotfiles/$1"
  to="$HOME/$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  mkdir -p "$(dirname "$to")"
  ln -s "$from" "$to"
}

# link files

link "git/gitconfig" ".gitconfig"
link "git/gitignore" ".gitignore"

link "karabiner/karabiner.json" ".config/karabiner/karabiner.json"

link "vscode/settings.json" "Library/Application Support/Code/User/settings.json"
link "vscode/keybindings.json" "Library/Application Support/Code/User/keybindings.json"

link "zsh/zshrc.zsh" ".zshrc"

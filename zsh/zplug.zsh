source /usr/local/Cellar/zplug/*/init.zsh

# Also prezto
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto

# zsh-syntax-highlighting must be loaded after executing
# compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "modules/history-substring-search", from:prezto, defer:2

# Extra plugins
zplug "denolfe/zsh-travis"

# Load theme file
zplug "LasaleFamine/phi-zsh-theme", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

source "$HOME/.dotfiles/profile.zsh"

# Then, source plugins and add commands to $PATH
zplug load

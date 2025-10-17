#!/bin/sh
set -e

# Ensure script runs from its own directory
cd "$(dirname "$0")" || exit 1

# Install Homebrew if not present, otherwise update
if command -v brew &> /dev/null; then
    brew update
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for this session (required on Apple Silicon)
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install core packages via Homebrew
# exa
brew install \
    bat \
    fd \
    fish \
    go \
    k3d \
    k9s \
    neovim \
    htop \
    jq \
    ripgrep \
    reattach-to-user-namespace \
    starship \
    tmux

# Configure fish shell
mkdir -p "$HOME/.config/fish/functions"
ln -fs "$PWD/fish/config.fish" "$HOME/.config/fish/config.fish"
ln -fs "$PWD/fish/fishfile" "$HOME/.config/fish/fishfile"
ln -fs "$PWD/fish/functions/fish_prompt.fish" "$HOME/.config/fish/functions/fish_prompt.fish"

# Configure git
ln -fs "$PWD/gitconfig" "$HOME/.gitconfig"
ln -fs "$PWD/gitignore" "$HOME/.gitignore"

# Set up tmux
ln -fs "$PWD/tmux.conf" "$HOME/.tmux.conf"

# Configure vim
mkdir -p "$HOME/.config/nvim"
ln -fs "$PWD/vimrc" "$HOME/.config/nvim/init.vim"
ln -fs "$PWD/vimrc" "$HOME/.vimrc"

# Configure VS Code (only if installed)
CODE_USER_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "$CODE_USER_DIR" ]; then
    ln -fs "$PWD/vs-code/settings.json" "$CODE_USER_DIR/settings.json"
    ln -fs "$PWD/vs-code/keybindings.json" "$CODE_USER_DIR/keybindings.json"
fi

# Link private env vars to be filled out
ln -fs "$PWD/private-env" "$HOME/.private-env"

# Change default shell to fish
FISH_PATH=$(which fish)
# Add fish to /etc/shells if not already present
grep -Fxq "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells
chsh -s "$FISH_PATH"

# Configure emacs (I now rarely use emacs--uncomment if needed)
# mkdir -p $HOME/.emacs.d/config/
# ln -fs $HOME/.dotfiles/emacs.d/init.el $HOME/.emacs.d/init.el
# ln -fs $HOME/.dotfiles/emacs.d/config/* $HOME/.emacs.d/config/

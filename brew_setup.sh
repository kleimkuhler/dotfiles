#!/bin/sh

# Install Homebrew
if which -s brew; then
    brew update
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install core packages via Homebrew
brew install bat exa fd fish git go neovim ripgrep reattach-to-user-namespace starship tmux

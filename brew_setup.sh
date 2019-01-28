# Install Homebrew
if which -s brew; then
    brew update
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install core packages via Homebrew
brew install autojump bat exa fd fish git neovim ripgrep reattach-to-user-namespace tmux tokei

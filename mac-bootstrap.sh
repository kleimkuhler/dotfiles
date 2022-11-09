#!/bin/sh

# Install Homebrew
if which -s brew; then
    brew update
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install core packages via Homebrew
brew install \
    bat \
    exa \
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
mkdir -p $HOME/.config/fish/functions
ln -fs $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $PWD/fish/fishfile $HOME/.config/fish/fishfile
ln -fs $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Configure git
ln -fs $PWD/gitconfig $HOME/.gitconfig
ln -fs $PWD/gitignore $HOME/.gitignore

# Set up tmux
ln -fs $PWD/tmux.conf $HOME/.tmux.conf

# Configure vim
mkdir -p $HOME/.config/nvim
ln -fs $PWD/vimrc $HOME/.config/nvim/init.vim
ln -fs $PWD/vimrc $HOME/.vimrc

# Configure VS Code
ln -fs $PWD/vs-code/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
ln -fs $PWD/vs-code/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"

# Configure emacs (I now rarely use emacs--uncomment if needed)
# mkdir -p $HOME/.emacs.d/config/
# ln -fs $HOME/.dotfiles/emacs.d/init.el $HOME/.emacs.d/init.el
# ln -fs $HOME/.dotfiles/emacs.d/config/* $HOME/.emacs.d/config/

# Link private env vars to be filled out
ln -fs $PWD/private-env $HOME/.private-env

# Change shell to fish
if ! command -v fish &> /dev/null
then
    echo $(which fish) | sudo tee -a /etc/shells
fi
sudo chsh -s $(which fish)

#!/bin/bash

set -eux

# Update and install packages
sudo apt update
sudo apt install -y \
    build-essential \
    clang \
    cmake \
    curl \
    fish \
    file \
    git \
    htop \
    jq \
    less \
    libssl-dev \
    neovim \
    pkg-config \
    procps \
    ripgrep

# gh
if ! command -v gh &> /dev/null
then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
fi

# k3d
if ! command -v k3d &> /dev/null
then
    curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
fi

# kubectl
if ! command -v kubectl &> /dev/null
then
    sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt update
    sudo apt install -y kubectl
fi

# rust
if ! command -v rustup &> /dev/null
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install starship prompt
curl -fsSL https://starship.rs/install.sh |sh -s -- --yes

# Configure fish shell
mkdir -p $HOME/.config/fish/functions
ln -fs $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $PWD/fish/fishfile $HOME/.config/fish/fishfile
ln -fs $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Configure git
ln -fs $PWD/gitconfig $HOME/.gitconfig
ln -fs $PWD/gitignore $HOME/.gitignore

# Configure vim
mkdir -p $HOME/.config/nvim
ln -fs $PWD/vimrc $HOME/.config/nvim/init.vim
ln -fs $PWD/vimrc $HOME/.vimrc

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

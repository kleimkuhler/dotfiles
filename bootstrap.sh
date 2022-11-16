#!/bin/bash

###
# bootstrap.sh is used for devcontainers. We can assume that most of the tools
# that would normally be installed will be included in the base image. For a
# more thorough installation, look at linux-bootstrap.sh or mac-bootstrap.sh.
###

set -eux

# Update and install core packages
sudo apt update
sudo apt install -y \
    build-essential \
    curl \
    file \
    fish \
    git \
    neovim \
    procps

# gh
if ! command -v gh &> /dev/null
then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
fi

# Configure bash shell
ln -fs $PWD/bash_profile $HOME/.bash_profile
ln -fs $PWD/bashrc $HOME/.bashrc

# Install starship prompt
curl -fsSL https://starship.rs/install.sh |sh -s -- --yes

# Configure fish shell
mkdir -p $HOME/.config/fish/functions
mkdir -p $HOME/.config/fish/completions
ln -fs $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $PWD/fish/fishfile $HOME/.config/fish/fishfile
ln -fs $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
ln -fs $PWD/fish/completions/kubectl.fish $HOME/.config/fish/completions/kubectl.fish
ln -fs $PWD/fish/completions/linkerd.fish $HOME/.config/fish/completions/linkerd.fish

# Configure git
ln -fs $PWD/gitconfig $HOME/.gitconfig
ln -fs $PWD/gitignore $HOME/.gitignore

# Configure vim
mkdir -p $HOME/.config/nvim
ln -fs $PWD/vimrc $HOME/.config/nvim/init.vim
ln -fs $PWD/vimrc $HOME/.vimrc

# Configure k3d
if command -v k3d >/dev/null 2>&1 ; then
    k3d kubeconfig merge -d 2>/dev/null || true
fi

# Add fish to available shells
if command -v fish &> /dev/null
then
    echo $(which fish) | sudo tee -a /etc/shells
fi

# Change shell
sudo chsh -s $(which fish)

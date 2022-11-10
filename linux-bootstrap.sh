#!/bin/bash

set -eux

# Update and install core packages
sudo apt update
sudo apt install -y \
    build-essential \
    curl \
    file \
    fish \
    git \
    procps

# Install Homebrew
if which -s brew; then
    brew update
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Hombrew packages
brew install \
    gh \
    jq \
    just \
    k3d \
    k9s \
    neovim \
    ripgrep

# helm
# curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# rust
if ! command -v rustup &> /dev/null
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
# if command -v k3d >/dev/null 2>&1 ; then
#     k3d kubeconfig merge -d 2>/dev/null || true
# fi

# Link private env vars to be filled out
ln -fs $PWD/private-env $HOME/.private-env

# Add fish to available shells
# if command -v fish &> /dev/null
# then
#     echo $(which fish) | sudo tee -a /etc/shells
# fi

# Change shell
# sudo chsh -s $(which fish)

####################
# Old configurations
####################

# sudo apt install -y \
#     clang \
#     cmake \
#     curl \
#     htop \
#     less \
#     pkg-config \

# gh
# if ! command -v gh &> /dev/null
# then
#     curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
#     echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
#     sudo apt update
#     sudo apt install -y gh
# fi

# k3d
# if ! command -v k3d &> /dev/null
# then
#     curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
# fi

# kubectl
# if ! command -v kubectl &> /dev/null
# then
#     sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#     echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
#     sudo apt update
#     sudo apt install -y kubectl
# fi

# Configure emacs (I now rarely use emacs--uncomment if needed)
# mkdir -p $HOME/.emacs.d/config/
# ln -fs $HOME/.dotfiles/emacs.d/init.el $HOME/.emacs.d/init.el
# ln -fs $HOME/.dotfiles/emacs.d/config/* $HOME/.emacs.d/config/

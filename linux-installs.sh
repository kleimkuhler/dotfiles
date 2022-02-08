#!/bin/bash

# gh
if ! command -v gh &> /dev/null
then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
fi
sudo apt update
sudo apt install gh

# k3d
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

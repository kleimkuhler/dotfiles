#!/bin/sh

# Setup VS Code configuration
ln -fs $PWD/vs-code/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
ln -fs $PWD/vs-code/keybindings.json "$HOME/Library/Application Support/Code/User/keybindings.json"

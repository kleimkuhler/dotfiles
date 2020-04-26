#!/bin/sh

# Set up emacs (I now rarely use emacs--uncomment if needed)
# mkdir -p $HOME/.emacs.d/config/
# ln -fs $HOME/.dotfiles/emacs.d/init.el $HOME/.emacs.d/init.el
# ln -fs $HOME/.dotfiles/emacs.d/config/* $HOME/.emacs.d/config/

# Set up fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

mkdir -p $HOME/.config/fish/functions
ln -fs $PWD/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $PWD/fish/fishfile $HOME/.config/fish/fishfile
ln -fs $PWD/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Set up git
ln -fs $PWD/gitconfig $HOME/.gitconfig
ln -fs $PWD/gitignore $HOME/.gitignore

# Set up tmux
ln -fs $PWD/tmux.conf $HOME/.tmux.conf

# Set up vim
mkdir -p $HOME/.config/nvim
ln -fs $PWD/vimrc $HOME/.config/nvim/init.vim
ln -fs $PWD/vimrc $HOME/.vimrc

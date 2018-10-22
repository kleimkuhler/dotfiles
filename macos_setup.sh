wd=$(pwd)

# Symlink configurations
mkdir -p $HOME/.config/fish/

ln -fs $wd/bashrc $HOME/.bashrc
ln -fs $wd/bash_profile $HOME/.bash_profile
ln -fs $wd/config.fish $HOME/.config/fish/config.fish
ln -fs $wd/gitconfig $HOME/.gitconfig
ln -fs $wd/gitignore $HOME/.gitignore
ln -fs $wd/tmux.conf $HOME/.tmux.conf
ln -fs $wd/vimrc $HOME/.vimrc

# Set up Emacs
mkdir -p $HOME/.emacs.d/config/

ln -fs $wd/emacs.d/init.el $HOME/.emacs.d/init.el
ln -fs $wd/emacs.d/config/* $HOME/.emacs.d/config/

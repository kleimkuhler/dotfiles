# Set working directory
wd=$(pwd)

# Set up emacs
mkdir -p $HOME/.emacs.d/config/

ln -fs $wd/emacs.d/init.el $HOME/.emacs.d/init.el
ln -fs $wd/emacs.d/config/* $HOME/.emacs.d/config/

# Set up fish
mkdir -p $HOME/.config/fish/
ln -fs $wd/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $wd/fish/functions $HOME/.config/fish/functions
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# Set up git
ln -fs $wd/gitconfig $HOME/.gitconfig
ln -fs $wd/gitignore $HOME/.gitignore

# Set up tmux
ln -fs $wd/tmux.conf $HOME/.tmux.conf

# Set up vim
ln -fs $wd/vimrc $HOME/.vimrc

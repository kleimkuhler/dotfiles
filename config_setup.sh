# Set up emacs
mkdir -p $HOME/.emacs.d/config/
ln -fs $HOME/.dotfiles/emacs.d/init.el $HOME/.emacs.d/init.el
ln -fs $HOME/.dotfiles/emacs.d/config/* $HOME/.emacs.d/config/

# Set up fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

mkdir -p $HOME/.config/fish/functions
ln -fs $HOME/.dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $HOME/.dotfiles/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# Set up git
ln -fs $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -fs $HOME/.dotfiles/gitignore $HOME/.gitignore

# Set up tmux
ln -fs $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

# Set up vim
mkdir -p $HOME/.config/nvim
ln -fs $HOME/.dotfiles/vimrc $HOME/.config/nvim/init.vim
ln -fs $HOME/.dotfiles/vimrc $HOME/.vimrc

# Always replace the current shell with a tmux client
if status is-interactive
and not set -q TMUX
   tmux attach || exec tmux new-session && exit
end

# Abbreviations
abbr -a e nvim
abbr -a c cargo
abbr -a co code
abbr -a g git

if type -q exa
    abbr -a l 'exa'
    abbr -a la 'exa -al --git'
    abbr -a ll 'exa -l --git'
    abbr -a lt 'exa -T'
else
    abbr -a l 'ls'
    abbr -a la 'ls -al'
    abbr -a ll 'ls -l'
end

# Additions to $fish_user_paths
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths

# Environment variables
if type -q bat
    set -x BAT_THEME "GitHub"
end

if test -f /usr/local/share/autojump/autojump.fish
    source /usr/local/share/autojump/autojump.fish
end

# Replace the current shell with a tmux client
# Commented out for initial setups
if status is-interactive
and not set -q TMUX
   tmux attach || exec tmux new-session && exit
end

# Set prompt
# Commented out for initial setups
starship init fish | source

# Abbreviations
abbr -a -g co    code
abbr -a -g d     docker
abbr -a -g e     nvim
abbr -a -g k     kubectl
abbr -a -g mkdir 'mkdir -p'

# Linkerd!
abbr -a -g sm         linkerd
abbr -a -g l5d-edge   'curl -sL https://run.linkerd.io/install-edge | sh'
abbr -a -g l5d-stable 'curl -sL https://run.linkerd.io/install | sh'

# Cargo
abbr -a -g c   cargo
abbr -a -g cb  'cargo build'
abbr -a -g cc  'cargo check'
abbr -a -g ccl 'cargo clean'
abbr -a -g cr  'cargo run'
abbr -a -g ct  'cargo test'

# Git
abbr -a -g g   git
abbr -a -g ga  'git add'
abbr -a -g gb  'git branch'
abbr -a -g gc  'git commit'
abbr -a -g gch 'git checkout'
abbr -a -g gcl 'git clone'
abbr -a -g gd  'git diff'
abbr -a -g gf  'git fetch'
abbr -a -g gl  'git log'
abbr -a -g gm  'git merge'
abbr -a -g gr  'git rebase'
abbr -a -g grm 'git remote'
abbr -a -g gpl 'git pull'
abbr -a -g gps 'git push'
abbr -a -g gs  'git status'
abbr -a -g gss 'git stash'
abbr -a -g gsu 'git submodule'

# Exa
if type -q exa
    abbr -a -g l  'exa'
    abbr -a -g la 'exa -al --git'
    abbr -a -g ll 'exa -l --git'
    abbr -a -g lt 'exa -T'
else
    abbr -a -g l  'ls'
    abbr -a -g la 'ls -al'
    abbr -a -g ll 'ls -l'
end

# Ripgrep
if type -q rg
    abbr -a -g grep rg
end

# Additions to $fish_user_paths
set -g fish_user_paths $HOME/.bin $fish_user_paths
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -g fish_user_paths $HOME/.linkerd2/bin $fish_user_paths
set -g fish_user_paths $HOME/Projects/go/bin $fish_user_paths

# Bootstrap fisher installation
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if type -q bat
    set -x BAT_THEME 'Solarized (light)'
    abbr -a -g cat bat
end

if type -q go
    set -x GOPATH $HOME/Projects/go
end

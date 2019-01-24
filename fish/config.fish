# Additions to path
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths

# Additional environment variables
set -x BAT_THEME "GitHub"

# Basic aliases
alias g="git"

# List aliases
alias l="exa"
alias la="exa -al"
alias ll="exa -l --git"
alias lt="exa -T"

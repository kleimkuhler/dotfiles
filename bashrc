# Include in path (Rust specific)
export PATH="$HOME/.cargo/bin:$PATH"

# Basic environment variables
export EDITOR=vim

# Basic aliases
alias g='git'
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'

# Command line format
export PS1='\
\[\e[1;34m\]\W\[\e[m\]\
\[\e[0;33m\]\
$(\
  b=`git symbolic-ref --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null`;\
  [ -n "$b" ] && printf " $b"\
)\[\e[m\] \
\[\e[1;32m\]\$\[\e[m\] '

# Let aliases work with sudo
alias sudo='sudo '

# OPAM configuration
. /Users/kleimkuhler/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true


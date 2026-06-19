export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Added by Antigravity
export PATH="/Users/ryan/.antigravity/antigravity/bin:$PATH"

export PATH="$HOME/code/llama.cpp/build/bin:$PATH"

export FZF_DEFAULT_OPTS="--bind ctrl-u:half-page-up,ctrl-d:half-page-down"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias gcd='cd $(git rev-parse --show-toplevel)'
alias tree='tree -C'
alias t2='tree -CL 2'

alias cc='gcc-15'
alias gcc='gcc-15'
alias c++='c++-15'
alias g++='g++-15'
export CC=gcc-15
export CXX=g++-15

autoload -U promptinit; promptinit
prompt pure
source <(fzf --zsh)

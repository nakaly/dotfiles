#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
	source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [[ -f ~/antigen.zsh ]]; then
	source ~/antigen.zsh
	antigen bundle sorin-ionescu/prezto
	antigen bundle mollifier/anyframe
fi

# Brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
	source $(brew --prefix)/etc/brew-wrap
fi

# anyframe
bindkey '^r' anyframe-widget-execute-history
bindkey '^]' anyframe-widget-cd-ghq-repository
bindkey '^ub' anyframe-widget-cdr
bindkey '^uo' anyframe-widget-checkout-git-branch
bindkey '^ui' anyframe-widget-insert-git-branch
bindkey '^uk' anyframe-widget-kill
bindkey '^uf' anyframe-widget-insert-filename

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# direnv
eval "$(direnv hook zsh)"

# git
export GIT_PAGER="lv -c"

# editor
export EDITOR=vim
export LESS="-X"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# plenv
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"

# login
source ~/.utils/login

# CUDA
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# mysql
export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27  
export PATH=$PATH:$MYSQL_PATH/bin

# RabbitMQ
PATH=$PATH:/usr/local/sbin

# Rust
PATH=$PATH:$HOME/.cargo/bin
#PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
#MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

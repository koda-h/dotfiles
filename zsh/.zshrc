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
PATH=$HOME/bin:$PATH

alias vi="/usr/local/bin/vim"
alias diff="colordiff -u"

#source ~/.zsh.d/z.sh
source ~/bin/peco_func

export LESS='-g -i -M -r -w -z-4'

[ ! $TMUX ] && tmux

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

export EDITOR=/usr/local/bin/vim
export GIT_EDITOR=/usr/local/bin/vim

unsetopt promptcr


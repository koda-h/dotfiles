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
PATH=/opt/homebrew/bin:$HOME/bin:$PATH
alias diff="colordiff -u"
alias tf="terraform"

source ~/bin/peco_func

export LESS='-g -i -M -r -w -z-4'

[ ! $TMUX ] && tmux

export EDITOR=/usr/local/bin/vim
export GIT_EDITOR=/usr/local/bin/vim
export COMPOSE_MENU=0

preexec() {
  print -P "%F{238}Run datetime:%f %F{238}%D{%Y-%m-%d %H:%M:%S}%f"
}

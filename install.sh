#~/bin/bash

cd ~/

zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

$ setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

brew insall tmux
brew insall reattach-to-user-namespace
brew install python3
brew install pyenv

ln -s /usr/local/bin/pip3 /usr/local/bin/pip


# tmux powerline
# https://blog.adachin.me/archives/5451
git clone https://github.com/powerline/powerline
git clone https://github.com/powerline/fonts.git

cp -pr ~/.pyenv/versions/3.8.2/lib/python3.8/site-packages/powerline/config_files/* ~/.config/powerline/

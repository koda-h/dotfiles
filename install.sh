#!/bin/zsh

git clone github_ludelvs:ludelvs/dotfiles

cd dotfiles

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install python3
brew install tig
brew install colordiff

ln -s /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip
ln -s /opt/homebrew/bin/python3 /opt/homebrew/bin/python

DOTFILES_DIR=$(pwd)
ln -s $DOTFILES_DIR/bin ~/

sudo mkdir /usr/local/bin

###############
#
# git setting
#
###############
ln -s $DOTFILES_DIR/git/.gitconfig ~/
ln -s $DOTFILES_DIR/git/.tigrc ~/
ln -s $DOTFILES_DIR/git/.gitmessage ~/

###############
#
# vim setting
#
###############

ln -s $DOTFILES_DIR/vim/ ~/.vim
ln -s ~/.vim/.vimrc ~/

sudo ln -s /usr/bin/vim /usr/local/bin/vim

###############
#
# zsh setting
#
###############
cd ~/

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

chsh -s /bin/zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

sed -i '.bak'  "s/theme\ \'sorin\'/theme 'redhat'/g" ~/.zpreztorc


cd $DOTFILES_DIR
rm ~/.zshrc
ln -s $DOTFILES_DIR/zsh/.zshrc ~/
sudo ln -s $DOTFILES_DIR/zsh/etc/zlogin /etc/zlogin


###############
#
# tmux setting
#
###############
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ../
rm -rf fonts

brew install tmux
brew install reattach-to-user-namespace

ln -s $DOTFILES_DIR/tmux/.tmux.conf ~/


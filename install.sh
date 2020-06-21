#!/bin/zsh

 git clone github_ludelvs:ludelvs/dotfiles

 cd dotfiles

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install python3
brew install tig

ln -s /usr/local/bin/pip3 /usr/local/bin/pip
ln -s /usr/local/bin/python3 /usr/local/bin/python

DOTFILES_DIR=$(pwd)
ln -s $DOTFILES_DIR/bin ~/

###############
#
# git setting
#
###############
ln -s $DOTFILES_DIR/git/.gitconfig ~/
ln -s $DOTFILES_DIR/git/.tigrc ~/

###############
#
# vim setting
#
###############

ln -s $DOTFILES_DIR/vim/ ~/.vim
ln -s ~/.vim/.vimrc ~/
ln -s /usr/bin/vim /usr/local/bin/vim


###############
#
# zsh setting
#
###############
cd ~/

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

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


brew tap sanemat/font
brew install ricty --with-powerline
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

brew install tmux
brew install reattach-to-user-namespace
pip install powerline-status

cd $(python -c "import site; print (site.getsitepackages())" | sed -e "s/\'//g" |sed -e "s/\[//g"|sed -e "s/\]//g")

SITE_PACKAGES_DIR=$(pwd)

cd $DOTFILES_DIR

$SITE_PACKAGES_DIR/powerline/bindings/tmux/powerline.conf

sed -i '.bak'  "s%source\ powerline.conf%source ${SITE_PACKAGES_DIR}/powerline/bindings/tmux/powerline.conf%g" tmux/.tmux.conf
rm -f tmux/.tmux.conf.bak

ln -s $DOTFILES_DIR/tmux/.tmux.conf ~/

mkdir ~/.config/powerline/
cp -rp ${SITE_PACKAGES_DIR}/powerline/config_files/* ~/.config/powerline/

p -pr ~/.pyenv/versions/3.8.2/lib/python3.8/site-packages/powerline/config_files/* ~/.config/powerline/


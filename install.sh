#!/usr/bin/env bash

set -e

echo "\x1b[33mAre you Ubuntu? [Y/n]: \x1b[0m"
read check
case $check in
	[Yy])
		check=""
		;;
	*)
		echo "Installation has been canceled. "
		exit 1
		;;
esac

# Set repositories
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get -y install python3-pip


# Basic tools
sudo apt-get -y install zsh upower curl gparted source-highlight imagemagick
sudo apt-get -y install git tig mycli bat pococom input_utils
sudo apt-get -y install manpages-ja manpages-ja-dev sleepenv

# Languages
sudo apt-get -y install gcc g++ gdb libc6-dev-i386
sudo apt-get -y install openjdk-8-jdk junit5
sudo apt-get -y install scala

# vim
sudo pip install neovim
sudo apt-get -y install universal-ctags vim-gtk3

# Dein
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

# fzf
mkdir -p ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# platformio
sudo git clone https://platformio/platformio.git /opt/platformio
sudo pip install platformio scons

# LaTeX
# sudo apt-get install texlive-lang-cjk texlive-font-utils texlive-fonts-extra xdvik-ja

echo "All tools are now installed completely!"
echo "And here's the list of tools that are not installed yet: "
echo " - sbt (Please refer to the official page. )"
echo " - gradle"
echo " - LaTeX (if you want it. )"

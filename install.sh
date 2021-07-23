#!/usr/bin/env bash

# 途中でメッセージを出力すべき

set -e

LOG_FILE="./install.log"
exec 1> >(tee -a $LOG_FILE)
Yellow="\x1b[33m"
Default="\x1b[0m"

echo -e "${Yellow}Are you Ubuntu? [Y/n]: ${default}"
read check
case $check in
	[Yy])
		echo -e "Install starting ..."
		;;
	*)
		echo -e "Install has been canceled. "
		exit 1
		;;
esac

# Set repositories
echo -e "${Yellow}log: repository add${Default}"
sudo add-apt-repository ppa:jonathonf/vim
echo -e "${Yellow}log: repository update${Default}"
sudo apt-get update
echo -e "${Yellow}log: install python3-pip${Default}"
sudo apt-get -y install python3-pip


echo -e "${Yellow}log: Basic tools${Default}"
# Basic tools
sudo apt-get -y install zsh upower curl gparted source-highlight imagemagick
sudo apt-get -y install git tig mycli bat
sudo apt-get -y install picocom input-utils sleepenh net-tools
sudo apt-get -y install manpages-ja manpages-ja-dev

echo -e "${Yellow}log: Languages${Default}"
# Languages
sudo apt-get -y install gcc g++ gdb libc6-dev-i386
sudo apt-get -y install openjdk-8-jdk junit5
sudo apt-get -y install scala

echo -e "${Yellow}log: vim${Default}"
# vim
sudo pip install neovim
sudo apt-get -y install universal-ctags vim-gtk3

echo -e "${Yellow}log: Dein.vim${Default}"
# Dein
mkdir -p ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

echo -e "${Yellow}log: fzf${Default}"
# fzf
mkdir -p ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "${Yellow}log: platformio${Default}"
# platformio
sudo git clone https://platformio/platformio.git /opt/platformio
sudo pip install platformio scons

# echo -e "${Yellow}log: LaTeX${Default}"
# LaTeX
# sudo apt-get install texlive-lang-cjk texlive-font-utils texlive-fonts-extra xdvik-ja

echo -e "All tools are now installed completely!"
echo -e "And here's the list of tools that are not installed yet: "
echo -e " - sbt (Please refer to the official page. )"
echo -e " - gradle"
echo -e " - LaTeX (if you want it. )"

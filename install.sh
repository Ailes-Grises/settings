#!/usr/bin/env bash

# 途中でメッセージを出力すべき

set -e

LOG_FILE="./install.log"
LOG_ERR="./error.log"
exec 1> >(tee -a $LOG_FILE)
exec 2> >(tee -a $LOG_ERR)

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
echo -e "\n${Yellow}log: repository add${Default}"
sudo add-apt-repository ppa:jonathonf/vim
echo -e "\n${Yellow}log: repository update${Default}"
sudo apt-get update
echo -e "\n${Yellow}log: install python3-pip${Default}"
sudo apt-get -y install python3-pip


# Basic tools
echo -e "\n${Yellow}log: Basic tools${Default}"
sudo apt-get -y install zsh upower curl gparted source-highlight imagemagick
sudo apt-get -y install git tig mycli bat jq
sudo apt-get -y install picocom input-utils sleepenh net-tools
sudo apt-get -y install manpages-ja manpages-ja-dev

# Languages
echo -e "\n${Yellow}log: Languages${Default}"
sudo apt-get -y install gcc g++ gdb libc6-dev-i386
sudo apt-get -y install openjdk-8-jdk junit5
sudo apt-get -y install scala

# vim
echo -e "\n${Yellow}log: vim${Default}"
sudo pip install neovim
sudo apt-get -y install universal-ctags vim-gtk3

# Dein
echo -e "\n${Yellow}log: Dein.vim${Default}"
if [ ! -d $HOME/.cache/dein/ ];then
	mkdir -p ~/.cache/dein
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
	sh ~/installer.sh ~/.cache/dein
	rm ~/installer.sh
else
	echo -e "\n${Yellow}log: Installation for \"Dein.vim\" was skipped"
fi

# platformio
echo -e "\n${Yellow}log: platformio${Default}"
if [ ! -d /opt/platformio/ ];then
	sudo git clone https://github.com/platformio/platformio.git /opt/platformio
	sudo pip install platformio scons
else
	echo -e "\n${Yellow}log: Installation for \"platformio\" was skipped"
fi

# fzf
echo -e "\n${Yellow}log: fzf${Default}"
if [ ! -d $HOME/.fzf/ ];then
	mkdir -p ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
else
	echo -e "\n${Yellow}log: Installation for \"fzf\" was skipped"
fi

# echo -e "${Yellow}log: LaTeX${Default}"
# LaTeX
# sudo apt-get install texlive-lang-cjk texlive-font-utils texlive-fonts-extra xdvik-ja

echo -e "\n${Yellow}"
echo -e "All tools are now installed completely!"
echo -e "And here's the list of tools that are not installed yet: "
echo -e " - sbt (Please refer to the official page. )"
echo -e " - gradle"
echo -e " - LaTeX (if you want it. )"
echo -e "${Default}"

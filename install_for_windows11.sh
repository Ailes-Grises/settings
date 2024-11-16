#!/usr/bin/env bash

# 途中でメッセージを出力すべき

set -e

LOG_FILE="./install_stdout.log"
LOG_ERR="./install_stderr.log"
exec 1> >(tee -a $LOG_FILE)
exec 2> >(tee -a $LOG_ERR)

Yellow="\x1b[33m"
Default="\x1b[0m"

echo -e "${Yellow}This is basic tool installer for ubuntu on Windows11.\nAre you Ubuntu? [Y/n]: ${Default}"
read check
case $check in
	[Yy])
		echo -e "Install starting ..."
		;;
	*)
		echo -e "Install has been cancelled. "
		exit 1
		;;
esac

# Set repositories
sudo apt-get update
echo -e "\n${Yellow}log: install python3-pip ...${Default}"
sudo apt-get -y install python3-pip

# Basic tools
echo -e "\n${Yellow}log: Basic tools ...${Default}"
sudo apt-get -y install zsh upower curl source-highlight imagemagick
sudo apt-get -y install git tig mycli jq
sudo apt-get -y install picocom input-utils sleepenh net-tools
sudo apt-get -y install manpages-ja manpages-ja-dev

# Languages
echo -e "\n${Yellow}log: Languages ...${Default}"
sudo apt-get -y install gcc g++ gdb libc6-dev-i386
# sudo apt-get -y install openjdk-8-jdk junit5
# sudo apt-get -y install scala

# vim
echo -e "\n${Yellow}log: vim ...${Default}"
# sudo pip install neovim
sudo apt-get -y install universal-ctags vim-gtk3

# 2024/11/17 github を見たが、なんかリポジトリが結構発達しているので最新のインストール方法を調べて手動実行したほうがよさそう。
# # platformio
# echo -e "\n${Yellow}log: platformio ...${Default}"
# if [ ! -d /opt/platformio ];then
# 	sudo git clone github.com/platformio/platformio.git /opt/platformio
# 	sudo pip install platformio scons
# else
# 	echo -e "${Yellow}log: Installation for \"platformio\" was skipped. "
# fi

# fzf
echo -e "\n${Yellow}log: fzf ...${Default}"
if [ ! -d $HOME/.fzf ];then
	mkdir -p ~/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
else
	echo -e "${Yellow}log: Installation for \"fzf\" was skipped. "
fi

echo -e "\n${Yellow}"
cat <<  EOF
All tools are now installed completely!
And here's the list of tools that are not installed yet: 
 - sbt (Please refer to the official page. )
 - gradle
 - LaTeX (if you want it. )

EOF
echo -e "${Default}"

#!/usr/bin/env bash

LOG_FILE="$HOME/deploy_stdout.log"
LOG_ERR="$HOME/deploy_stderr.log"
exec 1> >(tee -a $LOG_FILE)
exec 2> >(tee -a $LOG_ERR)

Yellow="\x1b[33m"
Default="\x1b[0m"


# Is here the directory "~/settings" ?
if [ ! $PWD = "$HOME/settings/" ];then
	echo -e "\n${Yellow}Please run this script on \"~/settings\" directory. "
	echo -e "Deployment has been canceled. ${Default}\n"
	exit 1
fi

# for $HOME
mv .bashrc $HOME
mv .zshrc $HOME
mv .vimrc $HOME
mv .git-prompt.sh $HOME
mv .colorrc $HOME
mv .termcolors.pl $HOME
mv .xmodmap_mysettings $HOME

# for source-highlight
if [ ! -d $HOME/.source-highlight ];then
	mkdir -p $HOME/.source-highlight
fi
mv jellybeans.style ~/.source-highlight

# for .vim
if [ ! -d $HOME/.vim/colors ];then
	mkdir -p ~/.vim/colors
fi
mv indent.pl ~/.vim
mv jellybeans.vim ~/.vim/colors
mv molokai.vim ~/.vim/colors

# Background thema
cp /usr/share/backgrounds/warty-final-ubuntu.png /usr/share/backgrounds/warty-final-ubuntu.png.default
mv backgrounds/ubuntu18.04LTS/warty-final-ubuntu.png /usr/share/backgrounds

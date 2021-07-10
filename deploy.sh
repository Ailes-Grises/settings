#!/usr/bin/env bash

# Is here the directory "~/settings" ?
if [ $PWD = "$HOME/settings" ];then
	echo "Please run this script on \"~/settings\" directory. "
	echo "Deployment has been canceled. "
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
mv jellybeans.style ~/.source-highlight

# for .vim
mkdir -p ~/.vim/colors
mv indent.pl ~/.vim
mv jellybeans.vim ~/.vim/colors
mv molokai.vim ~/.vim/colors

# Background thema
cp /usr/share/backgrounds/warty-final-ubuntu.png /usr/share/backgrounds/warty-final-ubuntu.png.default
mv backgrounds/ubuntu18.04LTS/warty-final-ubuntu.png /usr/share/backgrounds

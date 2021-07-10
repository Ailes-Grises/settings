#!/usr/bin/bash

echo "Are you WSL? [Y/n]: "
read check
case $check in
	[Yy])
		check=""
		;;
	*)
		echo "canceled. "
		exit 1
		;;
esac

# Eclipse(pleiades)
sudo ln -s /mnt/c/pleiades-2021-java-win-64bit-jre/pleiades ~/pleiades

# Windows home directory
sudo ln -s /mnt/c/User/your_name ~/winhome
sudo ln -s /mnt/c/User/your_name/Desktop ~/Desktop
sudo ln -s /mnt/c/User/your_name/Downloads ~/Downloads

# Firefox
sudo ln -s "/mnt/c/Program Files/Mozilla Firefox/firefox.exe" /usr/local/bin/firefox

# XAMPP
sudo ln -s /mnt/c/xampp/mysql/bin/mysql.exe /usr/local/bin/mysql
sudo ln -s /mnt/c/xampp/xampp-control.exe /usr/local/bin/xampp

# Git for Windows
sudo ln -s "/mnt/c/Program Files/Git/cmd/git.exe" /usr/local/bin/wingit

# Node.js
sudo ln -s "/mnt/c/Program Files/nodejs/" /usr/local/bin/nodejs

# Adobe Acrobat Reader
sudo ln -s "/mnt/c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe" /usr/local/bin/adobe-AcrobatRD

# Neovim (ver5.0)
sudo ln -s /opt/nvim-linux64/bin/nvim nvim

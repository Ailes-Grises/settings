#!/usr/bin/env bash

# Ubuntu 20.04 にReact.js の環境を構築するスクリプト.

# 参考サイト: 
# https://qiita.com/seibe/items/36cef7df85fe2cefa3ea
# https://qiita.com/rspmharada7645/items/25c496aee87973bcc7a5

set -e

LOG_FILE="./build_react.log"
LOG_ERR="./build_react.err"
exec 1> >(tee -a $LOG_FILE)
exec 2> >(tee -a $LOG_ERR)

Yellow="\x1b[33m"
Default="\x1b[0m"

echo -e "\n\nBuild a React.js development environment. "
echo -e "${Yellow}Installation: [nodejs, npm, n, yarn, create-react-app]${Default}"
echo "Are you sure? [Y/n]: "
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


echo -e "${Yellow}log: apt-get repository update ...${Default}"
sudo apt-get update

# ==== Node.js のインストール ==== #
echo -e "${Yellow}log: start installing npm ...${Default}"
sudo apt-get install -y nodejs npm
sudo npm install n -g
sudo n stable
sudo apt-get purge -y nodejs npm
exec $SHELL -l
node -v

# yarn のインストール
echo -e "${Yellow}log: start installing yarn ...${Default}"
sudo npm install --global yarn
yarn --version

# create-react-app のインストール
echo -e "${Yellow}log: start installing create-react-app ...${Default}"
yarn global add create-react-app

echo -e "${Yellow}log: Completed installing npm, nodejs, n, yarn, create-react-app. "

cat <<EOF

   And type like this if you want to create React application: 

     $ npx create-react-app app_name
     $ cd app_name
     $ yarn start

   Happy hacking!
EOF

echo -e "${Default}"


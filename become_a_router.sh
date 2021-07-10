#!/usr/bin/env bash

set -e

echo "現在使用中のPC をルータモードに変更します．本当に実行しますか? [Y/n]: "
read check
case $check in
	[Yy])
		check=""
		;;
	*)
		echo "キャンセルされました．"
		exit 1
		;;
esac

# このスクリプトは，Wifiが使えないPC1(SOTEC のCentOSとか)とまともなPC2(Panasonic のUbuntuとか)を有線接続することによって，
# PC1をネットに接続できるようにするものである．

# 1. CentOS(Wifiが使えない)上で，NIC の設定を行い，ゲートウェイとDNSをUbuntuのIPアドレスにしておく．

# 2. ルーティングテーブルを作成する(Ubuntuにとってのルータをゲートウェイとして設定する)
sudo route add default gw 192.168.10.1

# 3. Wifiに直接繋ぐPC上で，ファイアウォールの設定を変更する(IPマスカレードの設定とフィルタの設定)
sudo iptables -A FORWARD -i enp0s25 -o wlp3s0 -j ACCEPT
sudo iptables -A FORWARD -i wlp3s0 -o enp0s25 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE

# フォワーディングの設定
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -p

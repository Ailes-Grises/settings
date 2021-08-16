# Positions
Please run the following script to complete the deployment:
```
 $ ./deploy.sh
```

```

$HOME/ ---- .zshrc
        |-- .bashrc
        |-- .vimrc
        |-- .colorrc
        |-- .termcolors.pl
				|-- .xmodmap_mysettings
				|-- .git-prompt.sh
        |
        |-- .vim/ ---- indent.pl
        |          L-- colors/ ---- jellybeans.vim
        |
        |-- .cache/ ---- dein/ ---- installer.sh
        |
        L-- .source-highlight/ ---- jellybeans.style

```
# For Windows Terminal
```
$HOME/ ---- .inputrc
```
Please run the following script to complete the settings about Symbolic links:
```
 $ ./build_SymbolicLinks.sh
```

# Installation

Please run the following script to complete the Installation:
```
 $ ./install.sh
```

For less color
```
$ sudo apt-get install source-highlight
$ mkdir $HOME/.source-highlight
$ cp /usr/share/source-highlight/src-hilite-lesspipe.sh $HOME/.source-highlight
$ cp /usr/share/source-highlight/esc.style $HOME/.source-highlight/jellybeans.style
$ vim $HOME/.source-highlight/src-hilite-lesspipe.sh  => [ esc.style --> jellybeans.style ]
```

For Java
```
// デフォルトにすると、Java11 がインストールされる
$ sudo apt-get install default-jdk junit5

// Java8 をインストールしたい場合には、以下を実行する
$ sudo apt-get install openjdk-8-jdk junit5
```

For Scala and sbt
```
$ sudo apt-get install scala

$ google-chrome https://www.scala-sbt.org/download.html
```

# Network Settings
Ubuntu 17.10 からネットワークの設定方法が変わったので、固定IP のやり方をまとめておく。
参考サイトは<a href="https://note.com/ogs_digilife/n/nb9455f8f5f2b">こちら</a>

注意点は以下の通り:
- "/etc/network/interfaces" が廃止になった(何ィー!?)
- ネットワーク管理ツールがnetplan に変更になった
- 設定ファイルがyaml に変わった
	- yaml ファイルは"/etc/netplan/01-hogehoge.yaml" をコピーして、そこに全ての情報を書く
	- ファイル名は基本的になんでも良いが、デフォルトの"01-hogehoge.yaml"よりも英数字の順番が後ろになるような名前にしないと設定が反映されない(netplan は"/etc/netplan/" 内の設定ファイルを名前順に読み込んで上書き的に反映する、ネット上だと99_config.yaml とかいうファイル名が主流なのはそのため)
	- renderer はNetworkManager でもnetworkd でもどちらでも良い
- LAN ケーブルの両端がアクティブなポートに接続されていないと設定が適用されない(ここが一番ハマった、ネットワークあるある)
- 再起動の必要がなくなった(apply でok)

```
 $ ifconfig
 $ sudo vim /etc/netplan/02.yaml
 $ sudo netplan apply
```

設定ファイルは以下の通り:
```yaml
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s25:
      dhcp4: false
      dhcp6: false
      addresses: [192.168.1.60/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [192.168.1.1, 8.8.8.8]

# 配列を"[]" で書いてるけど、"-" で書いてもok
# LAN ケーブルの両端を繋がないと設定は反映されないぞ！
```


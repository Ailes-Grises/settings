# Positions
```
Please run the following script to complete the deployment:
```
 $ ./deploy.sh
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


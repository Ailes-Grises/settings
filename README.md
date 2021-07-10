# Positions
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

Symbolic links
```
// Eclipse(pleiades)
$ sudo ln -s /mnt/c/pleiades-2021-java-win-64bit-jre/pleiades ~/pleiades

// Windows home directory
$ sudo ln -s /mnt/c/User/your_name ~/winhome
$ sudo ln -s /mnt/c/User/your_name/Desktop ~/Desktop
$ sudo ln -s /mnt/c/User/your_name/Downloads ~/Downloads

// Firefox
$ sudo ln -s "/mnt/c/Program Files/Mozilla Firefox/firefox.exe" /usr/local/bin/firefox

// XAMPP
$ sudo ln -s /mnt/c/xampp/mysql/bin/mysql.exe /usr/local/bin/mysql
$ sudo ln -s /mnt/c/xampp/xampp-control.exe /usr/local/bin/xampp

// Node.js
$ sudo ln -s "/mnt/c/Program Files/nodejs/" /usr/local/bin/nodejs

// Adobe Acrobat Reader
$ sudo ln -s "/mnt/c/Program Files (x86)/Adobe/Acrobat Reader DC/Reader/AcroRd32.exe" /usr/local/bin/adobe-AcrobatRD
```

# Installation
For vim
```
// basic
$ sudo apt-get install vim-gtk3
$ sudo pip install neovim (pip3 かも?)

// ctags
sudo apt-get install universal-ctags

// jellybeans.vim 
$ cd $HOME/.vim/colors/
$ curl -O https://github.com/nanotech/jellybeans.vim/colors/jellybeans.vim

// Dein
$ sudo apt-get install neovim python3
$ mkdir -p $HOME/.cache/dein
$ cd $HOME/.cache/dein
$ git clone https://github.com/Shougo/dein.vim/
$ mv dein.vim/bin/installer.sh ./
$ rm -rf dein.vim
$ ./installer.sh ~/.cache/dein
$ vim -> :call dein#install())
```

For less color
```
$ sudo apt-get install source-highlight
$ mkdir $HOME/.source-highlight
$ cp /usr/share/source-highlight/src-hilite-lesspipe.sh $HOME/.source-highlight
$ cp /usr/share/source-highlight/esc.style $HOME/.source-highlight/jellybeans.style
$ vim $HOME/.source-highlight/src-hilite-lesspipe.sh  => [ esc.style --> jellybeans.style ]
```

For battery command
```
$ sudo apt-get install upower
```

For mysql
```
$ sudo apt-get install mycli
```

For Java
```
$ sudo apt-get install default-jdk junit5
```

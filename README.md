# Positions
```
$HOME/ ---- .zshrc
        |-- .bashrc
        |-- .vimrc
        |-- .colorrc
        |-- .termcolors.pl
        |
        |-- .vim/ ---- indent.pl
        |          L-- colors/ ---- jellybeans.vim
        |
        |-- .cache/ ---- dein/ ---- installer.sh
        |
        L-- .source-highlight/ ---- jellybeans.style

```

# Installation
For jellybeans.vim 
```
cd $HOME/.vim/colors/
curl -O https://github.com/nanotech/jellybeans.vim/colors/jellybeans.vim
```

For Dein
```
sudo apt-get install neovim python3
mkdir -p $HOME/.cache/dein
cd $HOME/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/bin/installer.sh > installer.sh
sudo chmod 755 installer.sh
./installer.sh ~/.cache/dein
```

For less color
```
sudo apt-get install source-highlight
mkdir $HOME/.source-highlight
cp /usr/share/source-highlight/src-hilite-lesspipe.sh $HOME/.source-highlihgt
cp /usr/share/source-highlight/esc.style $HOME/.source-highlight/jellybeans.style
vim $HOME/.source-highlihgt/src-hilite-lesspipe.sh  => [ esc.style --> jellybeans.style ]
```

For battery command
```
sudo apt-get install upower
```

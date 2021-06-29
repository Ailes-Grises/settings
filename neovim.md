# neovim にLSP をインストールする方法
基本的に[公式ドキュメント](#https://github.com/neovim/nvim-lspconfig)の通りに進める

1. neovim のversion5.0 のzip ファイルをダウンロードする
```
 // https://github.com/neovim/neovim/releases/tag/nightly のnvim-linux64.tar.gz をダウンロード

 // 展開して/opt に移動
 $ tar zxvf nvim-linux64.tar.gz
 $ mv nvim-linux64 /opt

 // パスを通す代わりにシンボリックリンク作成
 $ cd /usr/local/bin
 $ sudo ln -s /opt/nvim-linux64/bin/nvim nvim
```

1. neovim の設定ファイルを作成
```
 $ mkdir -p ~/.config/nvim/colors
 $ cd ~/.config/nvim
 $ cat ~/.vimrc > init.vim

 // nvim-lspconfig のインストール
 $ vim init.vim

   | call dein#add('neovim/nvim-lspconfig')
   | <ESC>:call dein#install()
```

1. 言語サーバのインストール
対応している言語サーバの一覧表とその導入方法は[こちら](#https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)
```
 // C言語の場合(clangd : https://clangd.llvm.org/installation.html)
 $ sudo apt-get intall clangd-9 // バージョンは9とすること

 // init.vim に追記
 $ vim ~/.config/nvim/init.vim

   | " C言語サーバ(clangd)
   | lua << EOF
   | require'lspconfig'.clangd.setup{}
   | EOF
```
公式を見ると他にもomnifunc やキーバインドの設定が書いてあるが、deoplete などの自動補完プラグインが入っている場合はこれだけでok. 

1. その他の設定
上記の例に挙げたclangd だと、これだけでは動作しない。
発動するには条件があり、[ここ](#https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd)に書いてある通り、プロジェクトルートにrootdir に書かれたいずれかのファイルが存在し、なおかつ編集しているファイルの拡張子がfiletypes に書かれているいずれかに当てはまらないと発動しない。

さらに、これでもまだ不十分で、[clangd の公式](#https://clangd.llvm.org/installation.html)を見ると、他にも結構色々やらないとダメっぽい。
面倒臭いので、本日はここまでにした。
後日続きを書きまーす。

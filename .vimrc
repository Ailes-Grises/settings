" very magic でメタ文字となるvi特有の文字は，以下の通り:
" =, &, @, ~

" very magic でエスケープしないとメタ文字扱いにならない文字は，以下の通り:
" |

set number
set title
set encoding=utf-8
set virtualedit=onemore
set tabstop=2
set shiftwidth=2
set guioptions+=a
set noswapfile
set nobackup
set clipboard=unnamed
set autoindent
set smartindent

" :highlightで使用可能なグループは :help highlight-groups で検索可能. syntax.txtが開かれる. 

" カーソル行のハイライトとその解除
nnoremap <silent> ;h :set cursorline<CR>:highlight CursorLine ctermfg=10<CR>
nnoremap <silent> ;H :highlight CursorLine ctermfg=none<CR>:set nocursorline<CR>

" カーソル下の文字のハイライト検索とその解除
nnoremap <silent> ;<Space> "xyiw :let @/='\<'.@x.'\>'<CR>:set hlsearch<CR>:%s/<C-r>x/&/gn<CR>
nnoremap <silent> <Space><Space> :set nohlsearch<CR>

" 全角記号のマッチング
nnoremap <silent> ;r :set hlsearch<CR>:%s/\v[”’＆＄％＃！＾〜ー＊＋｀？]/&/g<CR>

" 句読点の変換
nnoremap <silent> ;p :%s/\v、/，/g<CR>:%s/\v。/．/g<CR>

" バイナリ表示
nnoremap <silent> ;b :set binary<CR>:%!xxd<CR>
nnoremap <silent> ;B :%!xxd -r<CR>:set nobinary<CR>

" 文字数の表示
"vnoremap <silent> ;vcount :s/\v./&/g<CR>
nnoremap <silent> ;ncount :%s/\v./&/g<CR>

" ヤンクした文字列を検索する
nnoremap ;/ :set hlsearch<CR>:let @/=@"<CR>

" インデントの補正 (力作だぞw)
nnoremap ;= :w<CR> gg :call append(0, '')<CR>k:r!perl ~/.vim/indent.pl %<CR>jvG$xggdd

" Vundle
filetype plugin on
set rtp+=~/.vim/vundle/
call vundle#rc('~/.vim/bundle')

" 補完プラグイン
" Bundle 'Shougo/neocomplcache'

" カラースキーム
"colorscheme molokai
colorscheme jellybeans
"colorscheme tender
"colorscheme shirotelin

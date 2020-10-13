" very magic でメタ文字となるvi特有の文字は，以下の通り:
" =, &, @, ~
" very magic でエスケープしないとメタ文字扱いにならない文字は，以下の通り:
" |

" 基本設定
syntax on
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
set ignorecase
set smartcase
set t_Co=256
" set laststatus=2



" 編集モードのキーバインド
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>


" :highlightで使用可能なグループは :help highlight-groups で検索可能. syntax.txtが開かれる. 

" カーソル行のハイライトとその解除
nnoremap <silent> ;h :set cursorline<CR>:highlight CursorLine ctermfg=9<CR>
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
nnoremap ;= :w<CR> gg :call append(0, '')<CR>k:r!perl ~/.vim/indent.pl %<CR>jvG$xddggdd

" .vimrc の内容確認
nnoremap ;man :!less ~/.vimrc<CR>


" ===================== プラグインのパラメータ ========================

" ale のカーソル設定
let g:ale_echo_cursor = 0

" deoplete の設定(tab で選択)
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"


" =========================== fzf =====================================
command! Fmru FZFMru
command! FZFMru call fzf#run({
            \  'source':  v:oldfiles,
            \  'sink':    'tabe',
            \  'options': '-m -x +s',
            \  'down':    '40%'})


" =========================== Dein ====================================
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

	" ここにプラグインを書く
	" call dein#add('GiHubのユーザ名/リポジトリ.vim')
	" 呼び出しは，
	" :call dein#install()

	" fzf.vim
	call dein#add('junegunn/fzf', {'build': './install --all'})
	call dein#add('junegunn/fzf.vim')

	" ミニバッファの拡張
	call dein#add('fholgado/minibufexpl.vim')

	" 動的コードチェッカー
	call dein#add('dense-analysis/ale')

	" 補完
	call dein#add('Shougo/deoplete.nvim')

	" ステータスバーの設定
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

" ========================================================================

" カラースキーム
colorscheme jellybeans
"colorscheme molokai
"colorscheme tender
"colorscheme shirotelin
"

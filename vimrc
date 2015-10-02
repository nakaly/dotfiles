" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak'}}

" for Go
NeoBundle 'google/vim-ft-go'
NeoBundleLazy 'dgryski/vim-godef'
NeoBundleLazy 'vim-jp/vim-go-extra'
autocmd FileType go NeoBundleSource vim-godef vim-go-extra
set rtp^=$GOPATH/src/github.com/nsf/gocode/vim

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 基本設定
let mapleader=","              " キーマップリーダー
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start   " バックスペースでなんでも消せるように
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set showcmd                      " コマンドをステータス行に表示
set showmode                     " 現在のモードを表示
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効

" Hack#206 http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
"set mouse=a
"set ttymouse=xterm2

" 256色
set term=screen-256color
set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm


set ruler


set showmatch         " 括弧の対応をハイライト
set nonumber  " 相対番号
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex      " 印字不可能文字を16進数で表示

" コマンド実行中は再描画しない
:set lazyredraw
" 高速ターミナル接続を行う
:set ttyfast

" ハイライト on
syntax enable


" :Ptでインデントモード切替
command! Pt :set paste!

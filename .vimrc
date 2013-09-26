"▼  neobundle
"--------------------------------------------------------------------------
set nocompatible 
filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on


"▼  unite.vim
"--------------------------------------------------------------------------
"unite.vimをinsertモードで起動
let g:unite_enable_start_insert = 1
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
 
" unite.vim 起動時のremap 
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]n :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>


"▼  表示関連
"--------------------------------------------------------------------------
"文字コード
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp,euc-jp,cp932,latin1

"カラースキーマの設定
colorscheme desert
"色をつける
syntax enable 

"番号をつける
set number

"横線と縦線をつける
set cursorline
set cursorcolumn

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"括弧のハイライト時間を指定する(1/10秒)
set matchtime=1

"ステータスラインの設定
set statusline=%t\%=[%{&ff}]\[%{&fileencoding}]
"ステータスライン表示位置(下から)
set laststatus=2

"空白文字の可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

if has("syntax")
    syntax on
 
    " PODバグ対策
    syn sync fromstart
 
    function! ActivateInvisibleIndicator()
        "下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    endfunction
 
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif


"▼  移動操作
"--------------------------------------------------------------------------
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"vimの保存時にapacheを自動で再起動
"autocmd BufWritePre * :!sudo /etc/init.d/httpd restart

"▼  入力関連
"--------------------------------------------------------------------------
"新しい行のインデントを現在の行と同じにする
set autoindent

"タブの代わりに空白文字を入れる
set expandtab
"tabstop     (ts)  ファイル中の<Tab>文字を展開する文字数
"shiftwidth  (sw)  自動的に挿入される量
"softtabstop (sts) キーボードで<Tab>キーを押した時に挿入される空白の量
set ts=4 sw=4 sts=0

"バックスペースの挙動改善
set backspace=indent,eol,start


"▼  検索とか
"--------------------------------------------------------------------------
" ハイライトON
set hlsearch
" Esc Esc でハイライトOFF
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
"検索をファイルの先頭へループしない
set nowrapscan
"入力中でも検索結果を表示（インクリメンタルサーチ）
set incsearch
"検索時に大文字小文字を区別しない
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"補完機能に候補を表示する
set wildmenu


"キー変更
"--------------------------------------------------------------------------
"英字キーボードを使いやすくする
"noremap ; :
"noremap! ; :
"noremap : ;
"noremap! : ;
inoremap <C-d> $
inoremap <C-a> @
noremap <CR> $o<ESC>
imap {} {}<LEFT>
imap [] []<LEFT>
imap () ()<LEFT>
imap "" ""<LEFT>
imap '' ''<LEFT>
imap <> <><LEFT>
"--------------------------------------------------------------------------
"ファイルタイプ関連を有効にする
filetype plugin indent on


filetype off

""""""""""""""""""""""""""""""
" NeoBundleの設定
""""""""""""""""""""""""""""""

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vimの初期化 
call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundleを更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'

"---------------------------------------
" 読み込むプラグインを記載

" ハイライト(動かない)
NeoBundle 't9md/vim-quickhl'
"NeoBundleLazy 't9md/vim-quickhl', {
"    \ 'autoload' : {
"    \   'commands' : ["QuickhlAdd"],
"    \   'mappings' : ["<Plug>(quickhl-toggle)", "<Plug>(quickhl-reset)", "<Plug>(quickhl-match)"],
"    \   },
"    \}

" カラー
NeoBundle 'nanotech/jellybeans.vim'

" 関数一覧
NeoBundle 'vim-scripts/taglist.vim'

" ファイル一覧
NeoBundle 'scrooloose/nerdtree'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" 補完
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

NeoBundle 'alpaca-tc/alpaca_powertabline'

NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

"---------------------------------------

call neobundle#end()

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on
filetype on
syntax on

" インストールのチェック
NeoBundleCheck

""""""""""""""""""""""""""""""
" プラグインの設定
""""""""""""""""""""""""""""""

" taglist {{{
set tags = tags
let Tlist_Ctags_Cmd = 'C:/vim74-kaoriya-win64/ctags'
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_WinWidth = 40
" }}}

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

" nerdtree {{{
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" }}}

" indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
" }}}

" quickhl {{{
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)
" }}}

" Alpaca_Powertabline {{{
let g:alpaca_powertabline_enable = 1
" }}}

" powerline {{{
let g:Powerline_symbols = 'fancy'
" }}}

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 行番号の設定
""""""""""""""""""""""""""""""
set number
autocmd ColorScheme * highlight LineNr ctermfg=darkyellow guifg=#808000

""""""""""""""""""""""""""""""
" grepの設定
""""""""""""""""""""""""""""""
set grepprg=internal
autocmd QuickFixCmdPost *grep* cwindow
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

""""""""""""""""""""""""""""""
" その他の設定
""""""""""""""""""""""""""""""
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
"set ruler
" コマンドラインに使われる画面上の行数
"set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

set cursorline

set tabstop=4

set expandtab

set encoding=utf-8

set statusline=2

" タブページを常に表示
set showtabline=2

" gVimでもテキストベースのタブページを使う
set guioptions-=e

" 小文字で検索すると大文字と小文字を無視して検索する
" 大文字が入ると、ignorecase が無効にする
set ignorecase
set smartcase

""""""""""""""""""""""""""""""
" 表示の設定
""""""""""""""""""""""""""""""
set guifont=Consolas:h9:cSHIFTJIS
colorscheme jellybeans
set t_Co=256

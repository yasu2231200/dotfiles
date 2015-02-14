
filetype off

""""""""""""""""""""""""""""""
" NeoBundle�̐ݒ�
""""""""""""""""""""""""""""""

" vim�N�����̂�runtimepath��neobundle.vim��ǉ�
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" neobundle.vim�̏����� 
call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundle���X�V���邽�߂̐ݒ�
NeoBundleFetch 'Shougo/neobundle.vim'

"---------------------------------------
" �ǂݍ��ރv���O�C�����L��

" �n�C���C�g(�����Ȃ�)
NeoBundle 't9md/vim-quickhl'
"NeoBundleLazy 't9md/vim-quickhl', {
"    \ 'autoload' : {
"    \   'commands' : ["QuickhlAdd"],
"    \   'mappings' : ["<Plug>(quickhl-toggle)", "<Plug>(quickhl-reset)", "<Plug>(quickhl-match)"],
"    \   },
"    \}

" �J���[
NeoBundle 'nanotech/jellybeans.vim'

" �֐��ꗗ
NeoBundle 'vim-scripts/taglist.vim'

" �t�@�C���ꗗ
NeoBundle 'scrooloose/nerdtree'

" �C���f���g�ɐF��t���Č��₷������
NeoBundle 'nathanaelkane/vim-indent-guides'

" �⊮
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

"---------------------------------------

call neobundle#end()

" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o�A�t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on
filetype on
syntax on

" �C���X�g�[���̃`�F�b�N
NeoBundleCheck

""""""""""""""""""""""""""""""
" �v���O�C���̐ݒ�
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

""""""""""""""""""""""""""""""
" �}�����[�h���A�X�e�[�^�X���C���̐F��ύX
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" �����I�ɕ����ʂ����
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" �Ō�̃J�[�\���ʒu�𕜌�����
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" �s�ԍ��̐ݒ�
""""""""""""""""""""""""""""""
set number
autocmd ColorScheme * highlight LineNr ctermfg=darkyellow guifg=#808000

""""""""""""""""""""""""""""""
" grep�̐ݒ�
""""""""""""""""""""""""""""""
set grepprg=internal
autocmd QuickFixCmdPost *grep* cwindow
nnoremap [q :cprevious<CR>   " �O��
nnoremap ]q :cnext<CR>       " ����
nnoremap [Q :<C-u>cfirst<CR> " �ŏ���
nnoremap ]Q :<C-u>clast<CR>  " �Ō��

""""""""""""""""""""""""""""""
" ���̑��̐ݒ�
""""""""""""""""""""""""""""""
" �X���b�v�t�@�C���͎g��Ȃ�(�Ƃ��ǂ��ʓ|�Ȍx�����o�邾���Ŗ��ɗ��������Ƃ��Ȃ�)
set noswapfile
" �J�[�\�������s�ڂ̉���ڂɒu����Ă��邩��\������
set ruler
" �R�}���h���C���Ɏg�����ʏ�̍s��
set cmdheight=2
" �G�f�B�^�E�B���h�E�̖�������2�s�ڂɃX�e�[�^�X���C�����펞�\��������
set laststatus=2
" �X�e�[�^�X�s�ɕ\����������̎w��(�ǂ����炩�R�s�y�����̂ōׂ����Ӗ��͂킩���Ă��Ȃ�)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" �J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]

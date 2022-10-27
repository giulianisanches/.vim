set nocompatible
set notimeout
set nowrap
set nobackup
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set backspace=indent,eol,start
set cindent
set mouse=a
set showmatch
set showmode
set mousehide
set incsearch
set hlsearch
set ignorecase
set infercase
set magic
set autoindent
set smartindent
set encoding=utf-8
set autowrite
set wildmode=list:longest,full
set wildmenu
set shortmess=atTI
set number
set laststatus=2
set statusline=%<%F\ %=%-5.(%L\ %v\ %m\ %r%)
set sm
set columns=84
set lines=38
set guitablabel=%t%m
set guitabtooltip=%F
set guioptions-=T
set guioptions-=m
if has('win32')
    set guifont=Consolas:h11:cANSI
    let g:netrw_cygwin = 0
    let g:netrw_scp_cmd = '"C:\Tools\PuTTY\pscp.exe" -q'
    let g:netrw_sftp_cmd = '"C:\Tools\PuTTY\psftp.exe"'
    let g:netrw_ssh_cmd = '"C:\Tools\PuTTY\plink.exe"'
    helptags $HOME/vimfiles/doc
else
    set guifont=Monaco:h12
    helptags $HOME/.vim/doc
endif

set completeopt=longest,menuone,preview

let Tlist_Close_On_Select = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Display_Tag = 0
let Tlist_Display_Prototype = 1

let g:bufExplorerSplitBelow = 1
let g:bufExplorerShowRelativePath=1  " Show relative paths.

cab W w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q q

syntax on

filetype plugin on
filetype indent on

noremap <Space> <PageDown>
noremap <S-Space> <PageUp>

inoremap <S-CR> <Esc>O
inoremap <C-CR> <Esc>o

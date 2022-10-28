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
set completeopt=longest,menuone,preview

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

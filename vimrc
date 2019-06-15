" teste 
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
else
    set guifont=Monaco:h12
endif

set completeopt=longest,menuone,preview

let g:netrw_cygwin = 0
let g:netrw_scp_cmd = '"C:\Tools\PuTTY\pscp.exe" -q'
let g:netrw_sftp_cmd = '"C:\Tools\PuTTY\psftp.exe"'
let g:netrw_ssh_cmd = '"C:\Tools\PuTTY\plink.exe"'

let NERDSpaceDelims = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$', '\~$']
let NERDTreeChDirMode = 1

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

colorscheme zenburn

if has('win32')
    helptags $HOME/vimfiles/doc
else
    helptags $HOME/.vim/doc
endif

" busca similar a do textmate
function! OpenIt(name)
    let l:_name = substitute(a:name, "\\s", "*", "g")
    let l:list=system("find . -iname '*".l:_name."*' -not -name \"*.class\" -and -not -name \"*.swp\" | perl -ne 'print \"$.\\t$_\"'")
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if l:num < 1
        echo "'".a:name."' not found"
        return
    endif

    if l:num != 1
        echo l:list
        let l:input=input("Which ? (<enter>=nothing)\n")

        if strlen(l:input)==0
            return
        endif

        if strlen(substitute(l:input, "[0-9]", "", "g"))>0
            echo "Not a number"
            return
        endif

        if l:input<1 || l:input>l:num
            echo "Out of range"
            return
        endif

        let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
    else
        let l:line=l:list
    endif

    let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
    execute ":e ".l:line
endfunction

fun! s:SelectHTML()
    let n = 1
    while n < 50 && n < line("$")
        " check for jinja
        if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\s*%}'
            set ft=htmljinja
            return
        endif
        " check for django
        if getline(n) =~ '{%\s*\(extends\|block\|comment\|ssi\|if\|for\|blocktrans\)\>'
            set ft=htmldjango
            return
        endif
        " check for mako
        if getline(n) =~ '<%\(def\|inherit\)'
            set ft=mako
            return
        endif
        " check for genshi
        if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
            set ft=genshi
            return
        endif

        " check for php
        if getline(n) =~ '<?php'
            set ft=phtml
            return
        endif
        
        " check for template toolkit
        if getline(n) =~ '[%\s?(*)\s%]'
            set ft=tt2html
            return
        endif

        let n = n + 1
    endwhile
    " go with html
    set ft=html
endfun

command! -nargs=1 OpenIt :call OpenIt("<args>")

" salva a posição do cursor
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" define o tipo phtml para alguns arquivos dentro de determinados diretorios
au BufRead,BufNewFile *.wsgi set filetype=python
au BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()
au BufNewFile,BufRead *.tt,*.tt2  set ft=html.tt2html
au BufNewFile,BufRead *.rhtml setlocal ft=eruby
au BufNewFile,BufRead *.wsdl,*.bpel setlocal ft=xml
 
au FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako,tt2html,html.tt2html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

noremap ,t :NERDTreeToggle<CR>
noremap ,b :BufExplorer<CR>
noremap ,g :TlistToggle<CR>
noremap ,o :OpenIt 
noremap <Space> <PageDown>
noremap <S-Space> <PageUp>

inoremap <S-CR> <Esc>O
inoremap <C-CR> <Esc>o

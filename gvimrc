set guitablabel=%t%m
set guitabtooltip=%F
set guioptions-=T
set guioptions-=m

if has('win32')
    set guifont=Consolas:h14:cANSI
else
    if has('macunix') || has('mac')
        set guifont=Monaco:h14
    else
        set guifont=DejaVu\ Sans\ Mono:h12
    endif
endif

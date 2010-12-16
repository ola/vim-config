colorscheme oceandeep

set cursorline
set laststatus=2
set ruler
set showcmd
set showmatch
set showmode
set title

set statusline+=%f\                                           " filename
set statusline+=[%{strlen(&ft)?&ft:'none'}]                   " filetype
set statusline+=%h%1*%m%r%w%0*                                " flags
set statusline+=%=                                            " right align
set statusline+=%{fugitive#statusline()}                      " git status
set statusline+=(%l,%c%V)\ %<%P                               " offset


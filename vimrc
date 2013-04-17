filetype off

call pathogen#infect()
call pathogen#helptags()

set nocompatible

filetype plugin indent on

let mapleader = ","

" Basic options {{{

set fileformat=unix
set encoding=utf-8
set modelines=0
set cpoptions+=$
set hidden
set history=1000
set vb t_vb=
set nobackup
set nowrap
set splitbelow
set splitright
set cursorline
set laststatus=2
set ruler
set showcmd
set showmode
set title
set ttyfast
set autoread

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Save on losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" }}}

" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.git,.hg,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.class,*.jar,target,classes,lib
set wildignore+=*.pyc,*.luac
set wildignore+=*.sw? 
set wildignore+=*.DS_Store

" }}}

" Tabs, spaces, indents {{{

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smartindent

set switchbuf=usetab

" }}}

" Status line {{{

set statusline+=%f\                                           " filename
set statusline+=[%{strlen(&ft)?&ft:'none'}]                   " filetype
set statusline+=%h%1*%m%r%w%0*                                " flags
set statusline+=%=                                            " right align
set statusline+=%{fugitive#statusline()}                      " git status
set statusline+=(%l,%c%V)\ %<%P                               " offset

" }}}

" Color scheme {{{

syntax on
set background=dark
colorscheme oceandeep

" }}}

" Searching {{{

nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set gdefault

" }}}

" Keybindings {{{

nnoremap j gj
nnoremap k gk

noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a
map <F7> :set list!<CR>
map <F8> :set number!<CR>

map <Leader>w :w<CR>
map <Leader>q :q!<CR>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" <leader><leader> switches between current and previous buffers
nnoremap <leader><leader> <c-^>

nnoremap <leader><space> :noh<cr>

" Removes trailing whitespaces.
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Retab 
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Removes empty lines
nmap <Leader>_ :call Preserve("g/^$/d")<CR>

" Reselect just pasted text
nnoremap <leader>v V`]

" use C-j and C-k to 'bubble' lines (see
" http://vimcasts.org/episodes/bubbling-text/)
map <C-j> ddp
map <C-k> ddkP

" expand to directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Plugin mappings
map <Leader>bo :BufOnly<CR>
map <Leader>A :Ack<SPACE>
map <F3> :TagbarToggle<CR>

" ctrl-p
map <leader>t :CtrlP<CR>
map <leader>T :CtrlP %%<CR>

" Fugitive
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gp :Git push<CR>
map <Leader>gco :Gread<CR>
map <Leader>gci :Gcommit<CR>

nnoremap K <nop>

" }}}

" Functions {{{

" Preserve by Jonathan Palardy.
" See http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" }}}

" Environments (GUI/Console) {{{

if has("gui_running")
  let g:Powerline_symbols = 'fancy'

  "set guifont=Liberation\ Mono:h18
  set guifont=Menlo\ For\ Powerline:h18
  set guioptions=aem
  set guitablabel=%N\ %t\ %M

  highlight SignColumn gui=bold guibg=grey6 guifg=LightSkyBlue3
  highlight SpellBad term=underline gui=undercurl guisp=Orange

  " Use a line-drawing char for pretty vertical splits.
  set fillchars+=vert:│

  if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
  else
    " Not MacVIM
  endif
else
  " Console
endif

" }}}

" Scala {{{

augroup ft_scala
  au!

  au FileType scala setlocal foldlevel=99
  au FileType scala setlocal foldmethod=marker
  au FileType scala setlocal foldmarker={,}

  au FileType scala setlocal makeprg=sbt\ -Dsbt.log.noformat=true\ compile

  au FileType scala setlocal errorformat=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
        \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
        \%-G%.%#
augroup END

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }

" }}}

" VIM {{{

augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Groovy {{{

augroup ft_groovy
  au!

  au BufNewFile,BufRead *.gradle setf groovy

" }}}


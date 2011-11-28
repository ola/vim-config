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

map <F7> :set list!<CR>
map <F8> :set number!<CR>

map <Leader>w :w<CR>
map <Leader>q :q!<CR>

map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

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

" Plugin mappings
map <Leader>bo :BufOnly<CR>
map <Leader>A :Ack<SPACE>
map <Leader>T :TagbarToggle<CR>

" Fugitive
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>ga :Gadd<CR>
map <Leader>gp :Git push<CR>
map <Leader>gco :Gcheckout<CR>
map <Leader>gci :Gcommit<CR>

" Remap annoying keys
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a
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
  set guifont=Liberation\ Mono:h16

  set guitablabel=%N\ %t\ %M
  set guioptions=aem

  highlight SpellBad term=underline gui=undercurl guisp=Orange

  " Use a line-drawing char for pretty vertical splits.
  set fillchars+=vert:│

  if has("gui_macvim")
    set lines=120
    set columns=120

    set fuoptions=maxvert,maxhorz
  else
    " Not MacVIM
  endif
else
  " Console
endif

" }}}


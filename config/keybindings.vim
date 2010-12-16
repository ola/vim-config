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

" use C-j and C-k to 'bubble' lines (see
" http://vimcasts.org/episodes/bubbling-text/)
map <C-j> ddp
map <C-k> ddkP

" Plugin mappings
map <Leader>bo :BufOnly<CR>

map <Leader>A :Ack<SPACE>

map <Leader>T :TlistToggle<CR>

" fugitive
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Git push<CR>


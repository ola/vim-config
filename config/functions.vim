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

" Removes trailing whitespaces.
nmap <Leader>$ :call Preserve("%s/\\s\\+$//e")<CR>

" Retab 
nmap <Leader>= :call Preserve("normal gg=G")<CR>

" Removes empty lines
nmap <Leader>_ :call Preserve("g/^$/d")<CR>

if has('win32') || has('win64')
    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        silent execute '!D:\Applications\vim\vim72\diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    endfunction
endif

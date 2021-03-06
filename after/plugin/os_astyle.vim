" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: os_astyle.vim
" Last Modified: 2017-12-18 16:11:42
" Vim: enc=utf-8

" For os hw astyle
" open file become spaces and become tabs when leaving
function! SpacesToTabs()
    execute "set expandtab"
    execute "retab"
    execute "up"
endfunction

autocmd BufRead,BufNewFile ~/col5/os/**/*.c call SpacesToTabs()
autocmd BufRead,BufNewFile ~/col5/os/**/*.h call SpacesToTabs()

function! TabsToSpaces(is_wq)
    if a:is_wq == 1
        execute "up"
    endif
    while &modified != 0
        execute "earlier"
    endwhile
    execute "set noexpandtab"
    execute "normal! \gg=G"
    execute "x"
endfunction

function! MapwqTabsToSpaces()
    execute "cmap wq call TabsToSpaces(1)"
endfunction

" autocmd BufDelete,VimLeave ~/col5/os/**/*.c call TabsToSpaces(0)
" autocmd BufDelete,VimLeave ~/col5/os/**/*.h call TabsToSpaces(0)
" autocmd VimEnter ~/col5/os/**/*.c call MapwqTabsToSpaces()
" autocmd VimEnter ~/col5/os/**/*.h call MapwqTabsToSpaces()
autocmd VimLeave ~/col5/os/**/*.c execute "!astyle *.c *.h"
autocmd VimLeave ~/col5/os/**/*.h execute "!astyle *.c *.h"

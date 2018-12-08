" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: c.vim
" Last Modified: 2018-12-08 20:48:21
" Vim: enc=utf-8

" Abbreviations
:iab #i #include <><LEFT><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _pr printf();<LEFT><LEFT><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _main #include <stdio.h>
    \<CR>
    \<CR>int main(int argc, char *argv[]){
    \<CR><CR>
    \<CR>return 0;
    \<CR>}<UP><UP><TAB><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab //// /*<CR><BS>
    \ * <CR><BS>
    \ */<UP><C-R>=Eatchar('\m\s\<bar>\r')<CR>

" Title information
function! AddTitle()
    call append(0,"// Author: Huang Po-Hsuan <aben20807@gmail.com>")
    call append(1,"// Filename: ".expand("%:t"))
    call append(2,"// Last Modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(3,"// Vim: enc=utf-8")
    call append(4,"// !gcc -std=c11")
    call append(5,"")
endfunction

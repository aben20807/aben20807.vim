" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: c.vim
" Last Modified: 2019-12-21 11:33:16
" Vim: enc=utf-8

" Abbreviations
:iab #i #include <C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _pr printf("");<LEFT><LEFT><LEFT><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _sc scanf("");<LEFT><LEFT><LEFT><C-R>=Eatchar('\m\s\<bar>\r')<CR>

:iab _for for(int i = 0; i < ; i++) {
    \<CR>}<UP><ESC> 18li<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _fori for(int i = 0; i < ; i++) {
    \<CR>}<UP><ESC> 18li<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _forj for(int j = 0; j < ; j++) {
    \<CR>}<UP><ESC> 18li<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _main #include <stdio.h>
    \<CR>
    \<CR>int main(int argc, char *argv[]) {
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

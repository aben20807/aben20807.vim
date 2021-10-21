" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: c.vim
" Last Modified: 2019-12-21 11:33:16
" Vim: enc=utf-8

" Abbreviations
:iab #i #include <C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _pr printf("");<ESC>3ha<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _sc scanf("");<ESC>3ha<C-R>=Eatchar('\m\s\<bar>\r')<CR>

:iab _for for(int i = 0; i < ; i++) {
    \<CR>}<ESC>k18li<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _fori for(int i = 0; i < ; i++) {
    \<CR>}<ESC>k18li<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _forj for(int j = 0; j < ; j++) {
    \<CR>}<ESC>k18li<C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _main #include <stdio.h>
    \<CR>
    \<CR>int main(int argc, char *argv[]) {
    \<CR><CR>
    \<CR>return 0;
    \<CR>}<ESC>2ki<TAB><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab //// /*<CR><BS>
    \ * <CR><BS>
    \ */<ESC>ki<C-R>=Eatchar('\m\s\<bar>\r')<CR>

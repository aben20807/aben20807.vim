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
:iab _main #include <iostream>
    \<CR>// using namespace std;
    \<CR>
    \<CR>int main(int argc, char *argv[]) {
    \<CR><CR>
    \<CR>return 0;
    \<CR>}<ESC>2ki<TAB><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab //// /*<CR><BS>
    \ * <CR><BS>
    \ */<ESC>ki<C-R>=Eatchar('\m\s\<bar>\r')<CR>

:iab _dbg #include <bitset>
    \<CR>#include <limits.h>
    \<CR>#include <random>
    \<CR>#define b(bits, x) std::bitset<bits>(x)
    \<CR>#define b32(x) std::bitset<32>(x)
    \<CR>#define b64(x) std::bitset<64>(x)
    \<CR>std::mt19937 gen(0);
    \<CR>std::mt19937_64 gen64(0);
    \<CR>std::random_device rd;
    \<CR>std::mt19937 rgen(rd());
    \<CR>#define RANGE 1.0
    \<CR>std::uniform_real_distribution<> dis(-1*RANGE, RANGE);
    \<CR>#define p(x) std::cout << #x << "\t: " << x << std::endl;

" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: cpp.vim
" Last Modified: 2017-07-28 10:29:38
" Vim: enc=utf-8

" Comment
call CommentFormat("// ")

" Abbreviations
:iab #i #include <><LEFT><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _pr printf();<LEFT><LEFT><C-R>=Eatchar('\m\s\<bar>\r')<CR>
:iab _main #include <iostream>
    \<CR>using namespace std;
    \<CR>
    \<CR>int main(){
    \<CR><CR>
    \<CR>return 0;
    \<CR>}<UP><UP><TAB><C-R>=Eatchar('\m\s\<bar>\r')<CR>

" Title information
function! AddTitle()
    call append(0,"// Author: Huang Po-Hsuan <aben20807@gmail.com>")
    call append(1,"// Filename: ".expand("%:t"))
    call append(2,"// Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(3,"// Vim: enc=utf-8")
    call append(4,"// !g++ -std=c++11")
    call append(5,"")
endfunction

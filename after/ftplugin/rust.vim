" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: rust.vim
" Last Modified: 2017-08-05 22:48:29
" Vim: enc=utf-8

" Comment
call CommentFormat("// ")

function! AddTitle()
    call append(0,"// Author: Huang Po-Hsuan <aben20807@gmail.com>")
    call append(1,"// Filename: ".expand("%:t"))
    call append(2,"// Last Modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(3,"// Vim: enc=utf-8")
    call append(4,"// Rust Version: 1.20.0")
    call append(5,"// !rustc")
    call append(6,"")
endfunction

" Abbreviations
:iab <buffer> <expr> fn CodeAbbr("fn", "fn<SPACE><SPACE>{<CR>
    \<UP><ESC><S-^>f{hi<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> struct CodeAbbr("struct", "struct<SPACE><SPACE>{<CR>
    \<UP><ESC><S-^>f{hi<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> enum CodeAbbr("enum", "enum<SPACE><SPACE>{<CR>
    \<UP><ESC><S-^>f{hi<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> if CodeAbbr("if", "if<SPACE><SPACE>{<CR>
    \<UP><ESC><S-^>f{hi<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> for CodeAbbr("for", "for<SPACE><SPACE>{<CR>
    \<UP><ESC><S-^>f{hi<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> while CodeAbbr("while", "while<SPACE><SPACE>{<CR>
    \<UP><ESC><S-^>f{hi<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> loop CodeAbbr("loop", "loop<SPACE>{<CR>
    \<C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")

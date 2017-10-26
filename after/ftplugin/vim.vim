" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: vim.vim
" Last Modified: 2017-07-29 14:21:11
" Vim: enc=utf-8

" Comment
call CommentFormat("\" ")

" Abbreviations
:iab <buffer> <expr> function CodeAbbr("function", "function
    \<CR>
    \<CR>endfunction
    \<UP><TAB>
    \<UP><ESC>$li <C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> if CodeAbbr("if", "if
    \<CR>
    \<CR>endif
    \<UP><TAB>
    \<UP><ESC>$li <C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> for CodeAbbr("for", "for
    \<CR>
    \<CR>endfor
    \<UP><TAB>
    \<UP><ESC>$li <C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")
:iab <buffer> <expr> while CodeAbbr("while", "while
    \<CR>
    \<CR>endwhile
    \<UP><TAB>
    \<UP><ESC>$li <C-R>=Eatchar(\'\\m\\s\\<bar>\\r\')<CR>
    \")

" Title information
function! AddTitle()
    call append(0,"\" Author: Huang Po-Hsuan <aben20807@gmail.com>")
    call append(1,"\" Filename: ".expand("%:t"))
    call append(2,"\" Last Modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(3,"\" Vim: enc=utf-8")
    call append(4,"")
endfunction

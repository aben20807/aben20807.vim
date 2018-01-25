" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: python.vim
" Last Modified: 2018-01-25 22:15:28
" Vim: enc=utf-8

" Title information
function! AddTitle()
    call append(0,"# Author: Huang Po-Hsuan <aben20807@gmail.com>")
    call append(1,"# Filename: ".expand("%:t"))
    call append(2,"# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(3,"# Vim: enc=utf-8")
    call append(4,"# Python Version: 3.6")
    call append(5,"# !D:/cygwin/bin/python3")
    call append(6,"#-*- coding: UTF-8 -*-")
    call append(7,"")
endfunction

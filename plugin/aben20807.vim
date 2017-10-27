" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: aben20807.vim
" Last Modified: 2017-10-27 14:50:26
" Vim: enc=utf-8

" --- theme ---
syntax on
set t_Co=256
colorscheme ouo
" hilight current line
set cursorline
" hilight current column
"set cursorcolumn

" command abbreviate
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev db bd

" let cursor in the middle of screen when entering vim
autocmd VimEnter * :exec "normal! \zz"

" keep 3 lines below and above the cursor
set scrolloff=3

" in n, i mode can use mouse to select
set mouse=v

" hide mouse when typing
set mousehide

" Allow the cursor to move just past the end of the line
set virtualedit=onemore

" skip VI, must
set nocompatible

" let backspace can delete
set backspace=2

" --- tab ---
" tab size
set tabstop=4
" regard multiple spaces as tab
set softtabstop=4
" let tab become space
set expandtab

" indent size
set shiftwidth=4

" let line cannot wrap
set nowrap

" show line and column, use airline as an alternative
" set ruler

" show detailed mode
set showmode

" --- search ---
" hilight serach result
set hlsearch
" show result before typing finished
set incsearch
" igonre case
set ignorecase

" --- encoding ---
set encoding=utf8
scriptencoding utf-8

" let new page occurred at right or below
set splitright
set splitbelow

" let cursor no blinking
set gcr=a:block-blinkon0

" let history record=1000
set history=1000

" auto update if file changed in other way
set autoread

" auto change directory
set autochdir

" --- backup ---
" nobackup + writebackup = backup current file, deleted afterwards (default)
" no backup
set nobackup
" write into backup file
set writebackup
" use swap file
set swapfile

" igonre file
set wildignore+=*.o,*.obj,*.pyc

" not auto comment when changing line
" Ref: http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" show line numbers, use <F2> to switch
nnoremap <F2> :set norelativenumber!<CR>:set nonumber!<CR>
:set number
:set relativenumber

" let clipboard be the same between vim and os
if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

" file type
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
    autocmd BufRead,BufNewFile *.hpp,*.cpp set filetype=cpp
    autocmd BufRead,BufNewFile *.py,*.pyw set filetype=python
    autocmd BufRead,BufNewFile *.rs set filetype=rust
    autocmd BufRead,BufNewFile *.log set filetype=log
augroup END

" --- other important function ---
" eat char c if c is one member of pat
function Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat)? '': c
endfunction


" check if can use abbreviate (skip comment、const、string)
" Ref: https://superuser.com/questions/487603/abbreviations-override-in-comments-and-quoted-text
function! CodeAbbr(abbr, str)
    let syn = synIDattr(synIDtrans(synID(line('.'), col('.') - 1, 1)), 'name')
    if syn ==? 'Comment' || syn ==? 'Constant' || syn ==? 'String' || syn ==? 'Special'
        return a:abbr
    else
        return a:str
    endif
endfunction

" remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil <vim5632@rainslide.net>
function RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

" display date, compile and run
map <F5> :call CompileAndRun()<CR>
" save -> close ALE -> print date -> [execute] run -> open ALE
function! CompileAndRun()
    " save only when changed
    execute "up"
    execute "ALEDisable"
    if &filetype == 'markdown'
        " markdown preview
        try
            " Stop before starting and handle exception
            execute "MarkdownPreviewStop"
        catch /^Vim:E492:/
            execute "MarkdownPreview"
        endtry
    else
        " echo date time
        silent execute "!echo"
        silent execute "!echo -e '\033[31m ╔══════════════════════════════╗' "
        silent execute "!echo -n ' ║ '"
        silent execute "!echo -n `date`"
        silent execute "!echo    ' ║ '"
        silent execute "!echo -e '\033[31m ╚══════════════════════════════╝' \033[37m"
        " detect file type
        if &filetype == 'rust'
            " execute "!rustc % && time ./%< && rm %<"
            execute "!time RUST_BACKTRACE=1 cargo run"
        elseif &filetype == 'c'
            execute "!gcc -std=c11 % -o /tmp/a.out && time /tmp/a.out"
        elseif &filetype == 'cpp'
            execute "!g++ -std=c++11 % -o /tmp/a.out && time /tmp/a.out"
        elseif &filetype == 'java'
            execute "!javac -encoding utf-8 %"
            execute "!time java %<"
        elseif &filetype == 'sh'
            :!%
        elseif &filetype == 'python'
            execute "!time python3 %"
        else
            redraw
            echohl WarningMsg
                echo strftime("   ❖  不支援  ❖ ")
            echohl NONE
        endif
    endif
    execute "ALEEnable"
endfunction

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
nnoremap <F3> :IndentLinesToggle<CR>

call vundle#end()            " required
filetype plugin indent on    " required

" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: aben20807.vim
" Last Modified: 2019-01-08 20:33:23
" Vim: enc=utf-8

" --- theme ---
syntax on
set t_Co=256
colorscheme ouo
" hilight current line
set cursorline
" hilight current column
"set cursorcolumn
set colorcolumn=80

" let italic enable
" Ref: https://askubuntu.com/a/514524
set t_ZH=[3m
set t_ZR=[23m

" --- leader key ---
" global leader
let mapleader = ','
" local leader
" let maplocalleader = '_'

" command abbreviate
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev db bd

" let cursor in the middle of screen when entering vim
autocmd VimEnter * :exec "normal! \zz"

" return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line('$') |
            \   exe "normal! g`\"" |
            \ endif

" keep 3 lines below and above the cursor
set scrolloff=3

" in n, i mode can use mouse to select
set mouse=a

" hide mouse when typing
set mousehide

" Allow the cursor to move just past the end of the line
set virtualedit=onemore

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

" let labels not auto indent
set cinoptions+=L0

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

" let undo history not be clear after changing buffer
" Ref: https://stackoverflow.com/a/22676189/6734174
let vimDir = '$HOME/.vim'
let &runtimepath .= ',' . vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    silent call mkdir(myUndoDir, 'p')
    let &undodir = myUndoDir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" auto update if file changed in other way
set autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
function! Fresh(arg) abort
    " Ref: https://vi.stackexchange.com/a/14317
    if !bufexists("[Command Line]") | checktime | endif
endfunction
let timer = timer_start(5000,  'Fresh', {'repeat': -1})

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

" let clipboard be the same between vim and os
" if has('clipboard')
"     if has('unnamedplus')
"         set clipboard=unnamedplus
"     else
"         set clipboard=unnamed
"     endif
" endif

" file type
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
    autocmd BufRead,BufNewFile *.hpp,*.cpp set filetype=cpp
    autocmd BufRead,BufNewFile *.html set filetype=htmlm4
    autocmd BufRead,BufNewFile *.js set filetype=javascript
    autocmd BufRead,BufNewFile *.launch set filetype=xml " ROS
    autocmd BufRead,BufNewFile *.log set filetype=log
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.py,*.pyw set filetype=python
    autocmd BufRead,BufNewFile *.rs set filetype=rust
augroup END

" --- other important function ---
" eat char c if c is one member of pat
function! Eatchar(pat)
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
function! RemoveTrailingWhitespace()
    if &ft == "markdown"
        return
    endif
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

" add author information
" Ref: http://www.gegugu.com/2016/02/11/17175.html
" add or update
map <F4> :call TitleDet()<CR>
" autocmd BufWritePre,VimLeavePre * call TitleDet()
function! AddTitle()
endfunction
function! UpdateTitle()
    if &filetype == 'python'
        normal m'
        execute '/# *Last Modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
        normal ''
        normal mk
        execute '/# *Filename:/s@:.*$@\=": ".expand("%:t")@'
    elseif &filetype == 'vim'
        normal m'
        execute '/\" *Last Modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
        normal ''
        normal mk
        execute '/\" *Filename:/s@:.*$@\=": ".expand("%:t")@'
    elseif &filetype == 'c' || &filetype == 'cpp' || &filetype == 'rust'
        normal m'
        execute '/\/\/ *Last Modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
        normal ''
        normal mk
        execute '/\/\/ *Filename:/s@:.*$@\=": ".expand("%:t")@'
    endif
    execute "noh"
    normal 'k
endfunction

function! TitleDet()
    let n=1
    while n < 5
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\sModified:\S*.*$' ||
                    \line =~ '^\/\/\s*\S*Last\sModified:\S*.*$' ||
                    \line =~ '^\"\s*\S*Last\sModified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction

" Automatically create parent directories
" Ref: https://stackoverflow.com/a/4294176/6734174
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            silent call mkdir(expand('%:h'), 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" log the vim runtime record
" $ vim [filename] --startuptime log.txt
function! Vimdb_start()
    execute('profile start profile.log')
    execute('profile func *')
    execute('profile file *')
endfunction
function! Vimdb_end()
    execute('profile pause')
    execute('noautocmd qall!')
endfunction
command! Recstr call Vimdb_start()
command! Recend call Vimdb_end()

" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .keymap.vim
" Last Modified: 2017-07-27 09:17:35
" Vim: enc=utf-8

" let <F> key not type in insert mode
inoremap <F2>  <NOP>
inoremap <F3>  <NOP>
inoremap <F4>  <NOP>
inoremap <F5>  <NOP>
inoremap <F6>  <NOP>
inoremap <F8>  <NOP>
inoremap <F9>  <NOP>
inoremap <F10> <NOP>
inoremap <F11> <NOP>
inoremap <F12> <NOP>

" buffer move
map <F6> :bp!<CR>
map <F7> :bn!<CR>
nnoremap <silent> <C-l> :bn!<CR>
nnoremap <silent> <C-h> :bp!<CR>
nnoremap <silent> <C-k> :bp!<CR>
nnoremap <silent> <C-j> :bn!<CR>

" exit vim
nnoremap <F10> :exec "q!"<CR>
nnoremap <F11> :exec "up"<CR>
nnoremap <F12> :exec "x"<CR>

" move among split pages
nnoremap <silent> <C-Right> <C-w>l
nnoremap <silent> <C-Left>  <C-w>h
nnoremap <silent> <C-Up>    <C-w>k
nnoremap <silent> <C-Down>  <C-w>j

" move split window
nnoremap <silent> <C-S-Right> <C-w>L
nnoremap <silent> <C-S-Left>  <C-w>H
nnoremap <silent> <C-S-Up>    <C-w>K
nnoremap <silent> <C-S-Down>  <C-w>J

" change splite window size
nnoremap <M-+> <C-w>10>
nnoremap <M--> <C-w>10<
nnoremap <M-=> <C-w>=
nnoremap <M-_> <C-w>30><C-w>30+

" move more steps
nnoremap <M-h> 5h
nnoremap <M-j> 5j
nnoremap <M-k> 5k
nnoremap <M-l> 5l

" move in insert mode
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

" move in commend mode
cnoremap <M-h> <c-left>
cnoremap <M-l> <c-right>
cnoremap <M-k> <c-left>
cnoremap <M-j> <c-right>

" move screen
" Ref: https://stackoverflow.com/questions/3458689/how-to-move-screen-without-moving-cursor-in-vim
noremap <Up> <C-y>
noremap <Down> <C-e>

" tab indent
vmap <TAB> >gv
vmap <S-TAB> <gv

" new a line normal mode
nnoremap t o<ESC>
nnoremap T O<ESC>

" copy or cut to system clipboard
" vnoremap y "+y
" nnoremap yy "+yy
" vnoremap d "+d
" nnoremap dd "+dd

" paste in insert mode
inoremap <M-p> <ESC>pi<Right>

" cancel highlight after searching
noremap <M-n> :noh<CR>

" time display
" Ref: http://vim.wikia.com/wiki/Insert_current_date_or_time
function! DateAndTime()
    redraw
    echohl WarningMsg
        echo strftime("   ❖  現在時間 %H:%M ❖ ")
    echohl NONE
endfunction
nnoremap <M-t> :call DateAndTime()<CR>

" map alt key
function! Terminal_MetaMode(mode)
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_', '+', '=']
            call s:metacode(a:mode, c)
        endfor
    endif
    if &ttimeout == 0
        set ttimeout
    endif
    if &ttimeoutlen <= 0
        set ttimeoutlen=100
    endif
endfunction
call Terminal_MetaMode(0)

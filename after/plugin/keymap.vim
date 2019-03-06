" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: keymap.vim
" Last Modified: 2019-03-06 15:09:07
" Vim: enc=utf-8

" Overwrite default unused setting
nnoremap H ^
nnoremap L $
nnoremap M <NOP>
nnoremap K k
nnoremap q: :q
nnoremap <F1> <NOP>
vnoremap H ^
vnoremap L $
vnoremap M <NOP>
vnoremap K k
vnoremap <F1> <NOP>

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
inoremap <silent> <UP> <C-o>gk
inoremap <silent> <DOWN> <C-o>gj



" let <F> key not type in insert mode
" inoremap <F2>  <ESC><F2><CR>i
imap <F2>  <ESC><F2>li
imap <F3>  <ESC><F3>li
imap <F4>  <ESC><F4>li
imap <F5>  <ESC><F5>
imap <F6>  <ESC><F6>li
imap <F8>  <ESC><F8>li
imap <F9>  <ESC><F9>li
imap <F10> <ESC><F10>li
imap <F11> <ESC><F11>li
imap <F12> <ESC><F12>li

" background vim
inoremap <C-z> <C-o><C-z>

" buffer move
nmap <F6> :bp!<CR>
nmap <F7> :bn!<CR>
nnoremap <silent> <C-l> :bn!<CR>
nnoremap <silent> <C-h> :bp!<CR>
nnoremap <silent> <C-k> :bp!<CR>
nnoremap <silent> <C-j> :bn!<CR>

" show line numbers, use <F2> to switch
nnoremap <F2> :set norelativenumber!<CR>:set nonumber!<CR>
:set number
:set relativenumber

" map ctrl-a to select whole text
nnoremap <C-a> ggVG

" buffer map
for i in range(1, 9)
    exec 'noremap <Leader>'.i.' :'.i.'b!<CR>'
endfor

" exit vim
nnoremap <F10> :exec "q!"<CR>
nnoremap <F11> :exec "up"<CR>
" nnoremap <F12> :exec "x"<CR>

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
vnoremap <M-h> 5h
vnoremap <M-j> 5j
vnoremap <M-k> 5k
vnoremap <M-l> 5l

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
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" tab indent
vmap <TAB> >gv
vmap <S-TAB> <gv

" indent
nmap < <<
nmap > >>
nnoremap <M-,> <<
nnoremap <M-.> >>
vnoremap < <gv
vnoremap > >gv
vnoremap <M-,> <gv
vnoremap <M-.> >gv

" new a line normal mode
nnoremap t o<ESC>
nnoremap T O<ESC>

" copy or cut to system clipboard
" vnoremap y "+y
" nnoremap yy "+yy
" vnoremap d "+d
" nnoremap dd "+dd

" Not overwrite paste buffer after pasting
" Ref: https://stackoverflow.com/a/290723/6734174
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<CR>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <SID>Repl()

" paste in insert mode
inoremap <M-p> <ESC>pi<Right>

" map ctrl-f to search text
nnoremap <C-f> /
inoremap <C-f> <ESC>/

" cancel highlight after searching
noremap <M-n> :noh<CR>

" search select text by pressing // in visual mode
" Ref: http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
vnoremap <C-f> y/\V<C-r>=escape(@",'/\')<CR><CR>

" use esc to go back normal mode for terminal
tnoremap <Esc> <C-\><C-n>

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
        " call s:metacode(a:mode, nr2char(char2nr('A') + i)) " Ubuntu F2, F3
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

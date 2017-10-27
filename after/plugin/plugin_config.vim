" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: plugin_config.vim
" Last Modified: 2017-10-27 20:16:49
" Vim: enc=utf-8

" Config of all plugin
" --- vim-airline/vim-airline ---
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
" let g:airline_theme='ouo'
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E'
let airline#extensions#ale#warning_symbol = 'W'
let g:airline_left_sep = '»'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '«'
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.notexists = ' Φ'

" airline git symbol
" Plugin 'tpope/vim-fugitive'

" --- scrooloose/nerdtree ---
" Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
map <leader>ee :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.exe', '\.o']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeWinSize=25

function! s:ShowFilename()
    redraw | echohl Debug |
        \ echom index(["\" Press ? for help", "", ".. (up a dir)"], getline(".")) < 0 ?
        \ "NERDTree: " . matchstr(getline("."), "[0-9A-Za-z_/].*") : "" | echohl None
endfunction
autocmd CursorMoved NERD_tree* :call <SID>ShowFilename()

" --- terryma/vim-multiple-cursors ---
" Plugin 'terryma/vim-multiple-cursors'
"http://www.wklken.me/posts/2015/06/07/vim-plugin-multiplecursors.html
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-o>' "選中一個
let g:multi_cursor_prev_key='<C-p>' "放棄一個，回到上一個
let g:multi_cursor_skip_key='<C-x>' "跳過
let g:multi_cursor_quit_key='<Esc>' "退出

" --- Yggdroot/indentLine ---
" Plugin 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
nnoremap <F3> :IndentLinesToggle<CR>

" --- w0rp/ale ---
" Plugin 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'c': ['clang'],
\   'cpp': ['clang'],
\   'python': ['pylint'],
\   'vim': ['vint'],
\   'rust': ['rustc', 'cargo']
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1
let g:ale_sign_error = '◈'
let g:ale_sign_warning = '◈'
" check only after savind
let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 50
nnoremap <M-a> :ALEToggle<CR>
nmap <M-w> <Plug>(ale_previous_wrap)
nmap <M-e> <Plug>(ale_next_wrap)
autocmd VimEnter,Colorscheme * :hi ALEErrorSign     cterm=bold ctermfg=160
autocmd VimEnter,Colorscheme * :hi ALEWarningSign   cterm=bold ctermfg=166
autocmd VimEnter,Colorscheme * :hi ALEErrorLine     cterm=NONE
autocmd VimEnter,Colorscheme * :hi ALEError         cterm=NONE ctermfg=251 ctermbg=160
autocmd VimEnter,Colorscheme * :hi ALEWarning       cterm=NONE ctermfg=251 ctermbg=166

" Plugin 'rust-lang/rust.vim'

" --- maralla/completor.vim ---
" Plugin 'maralla/completor.vim'
" Plugin 'aben20807/completor.vim'
let g:completor_completion_delay=10
let g:completor_auto_close_doc=0
let g:completor_auto_trigger=0
let g:completor_min_chars=1
let g:completor_filesize_limit=4096
function! CompletorToggle()
    if g:completor_auto_trigger==0
        let g:completor_auto_trigger=1
    else
        let g:completor_auto_trigger=0
    endif
    set noshowmode
    redraw
    echohl WarningMsg
        echo "   ❖  completor ".((g:completor_auto_trigger==0)? "關閉": "開啟")." ❖ "
        echo ""
    echohl NONE
    set showmode
endfunction
inoremap <F7> <C-\><C-O>:call CompletorToggle()<CR>
inoremap <expr> <TAB> pumvisible() ?"\<C-n>": "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ?"\<C-p>": "\<S-TAB>"

" --- octol/vim-cpp-enhanced-highlight ---
" Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
let g:cpp_experimental_simple_template_highlight=1
let c_no_curly_error=1

" --- iamcco/markdown-preview.vim ---
" Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "cygstart /chrome.lnk"
let g:mkdp_auto_close = 0
let g:mkdp_auto_start = 0

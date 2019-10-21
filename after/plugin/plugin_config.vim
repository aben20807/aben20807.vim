" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: plugin_config.vim
" Last Modified: 2019-08-13 15:27:04
" Vim: enc=utf-8
" Config of all plugin

" --- vim-airline/vim-airline ---
set laststatus=2
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnametruncate = 10
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0:',
	\ '1': '1:',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'VL',
            \ '' : 'VB',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E'
let airline#extensions#ale#warning_symbol = 'W'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = 'B'
let g:airline_symbols.readonly = 'R'
let g:airline_symbols.notexists = '?'

" --- scrooloose/nerdtree ---
map <C-n> :NERDTreeToggle<CR>
map <leader>ee :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swo$', '\.swp$', '\.git$', '\.hg$', '\.svn$', '\.bzr$', '\.exe$', '\.o$', '\.orig$']
let NERDTreeChDirMode = 0
let NERDTreeQuitOnOpen = 1
let NERDTreeMouseMode = 2
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeWinSize = 25

function! s:ShowFilename()
    redraw | echohl Debug |
                \ echom index(["\" Press ? for help", "", ".. (up a dir)"], getline(".")) < 0 ?
                \ "NERDTree: " . matchstr(getline("."), "[0-9A-Za-z_/].*") : "" | echohl None
endfunction
autocmd CursorMoved NERD_tree* :call <SID>ShowFilename()

" --- terryma/vim-multiple-cursors ---
"http://www.wklken.me/posts/2015/06/07/vim-plugin-multiplecursors.html

" --- Yggdroot/indentLine ---
let g:indentLine_setColors = 0
" let g:indentLine_setConceal = 0
au BufRead,BufEnter,BufNewFile *.md :let g:indentLine_setConceal = 0
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '__Tag_List__']
let g:indentLine_fileTypeExclude = ['help', 'text']
nnoremap <F3> :IndentLinesToggle<CR>

" --- rust-lang/rust.vim

if v:version >= 800

" --- w0rp/ale ---
let g:ale_sign_column_always = 1
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'c': ['gcc'],
            \   'cpp': ['g++'],
            \   'python': ['pylint'],
            \   'vim': ['vint'],
            \   'rust': ['rustc', 'cargo']
            \}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
" check only after savind
let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 50
" compiler flag
" let g:ale_c_gcc_options='-std=c11 -Wall'
" let g:ale_cpp_gcc_options='-std=c++14 -Wall'
nnoremap <M-a> :ALEToggle<CR>
nmap <M-w> <Plug>(ale_previous_wrap)
nmap <M-e> <Plug>(ale_next_wrap)
autocmd VimEnter,Colorscheme * :hi ALEErrorSign     cterm=bold ctermfg=160
autocmd VimEnter,Colorscheme * :hi ALEWarningSign   cterm=bold ctermfg=166
autocmd VimEnter,Colorscheme * :hi ALEErrorLine     cterm=NONE
autocmd VimEnter,Colorscheme * :hi ALEError         cterm=NONE ctermfg=251 ctermbg=160
autocmd VimEnter,Colorscheme * :hi ALEWarning       cterm=NONE ctermfg=251 ctermbg=166

" --- maralla/completor.vim ---
let g:completor_completion_delay = 10
let g:completor_auto_close_doc = 0
let g:completor_auto_trigger = 0
let g:completor_min_chars = 1
let g:completor_filesize_limit = 4096
function! CompletorToggle()
    if g:completor_auto_trigger == 0
        let g:completor_auto_trigger = 1
    else
        let g:completor_auto_trigger = 0
    endif
    set noshowmode
    redraw
    echohl WarningMsg
    echo "   ❖  completor ".((g:completor_auto_trigger == 0)? "關閉": "開啟")." ❖ "
    echo ""
    echohl NONE
    set showmode
endfunction
inoremap <F7> <C-\><C-O>:call CompletorToggle()<CR>
inoremap <expr> <TAB> pumvisible() ?"\<C-n>": "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ?"\<C-p>": "\<S-TAB>"

else
    inoremap <F7> <NOP>
endif " v:version > 800

" --- octol/vim-cpp-enhanced-highlight ---
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let c_no_curly_error = 1

" --- iamcco/markdown-preview.vim ---
if !exists('g:browser')
    let g:browser = 0
endif
if g:browser == 0 " chrome in cygwin
    let g:mkdp_path_to_chrome = "cygstart /chrome.lnk"
else " firefox
    let g:mkdp_path_to_chrome = "/usr/bin/firefox"
endif
let g:mkdp_auto_close = 0
let g:mkdp_auto_start = 0

" --- pseewald/vim-anyfold ---
:AnyFoldActivate
set foldlevel=30
" save view when exit and load view when enter
" Ref: https://vi.stackexchange.com/a/13874
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd User anyfoldLoaded silent! loadview
augroup end

" --- majutsushi/tagbar ---
let g:tagbar_autofocus = 1
let g:tagbar_indent = 1
let g:tagbar_sort = 0
let g:tagbar_map_nexttag = "<C-o>"
" $ ctags --list-kinds=c
let g:tagbar_type_c = {
            \ 'ctagstype' : 'c',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'f:functions',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'm:members:0:0',
                \ 'v:variables:1:0'
            \ ]}
let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'f:functions',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'm:members:0:0',
                \ 'v:variables:1:0'
            \ ]}
nnoremap <C-t> :TagbarToggle<CR>

" --- junegunn/fzf.vim
command! FALL call fzf#run({'source': 'find ~/ -type f', 'sink':  'edit'})

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" --- junegunn/vader.vim
let g:vader_settings_showquickfix = 0
" Ref: https://github.com/junegunn/vader.vim/issues/130#issuecomment-298220235
function! RunVader() abort
    Vader
    cclose
endfunction
" Map F9 to running Vader tests.
noremap <buffer> <F9> :call RunVader()<CR>

" --- junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --- junegunn/goyo.vim ---
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" --- aben20807/committia.vim (rhysd/committia.vim) ---
let g:committia_resize_status_window = 0
let g:committia_min_window_width = 40
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell
    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    endif
    " Scroll the diff window from insert mode
    imap <buffer><C-j> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-k> <Plug>(committia-scroll-diff-up-half)
endfunction

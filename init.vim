" Author: Huang Po-Hsuan
" Location: ~/.config/nvim/init.vim
" =============================================================================
" # Color
" =============================================================================
set t_Co=256
set termguicolors
set background=dark
let base16colorspace=256
set rtp+=~/.config/nvim/plugged/base16-vim/
colorscheme base16-gruvbox-dark-hard
syntax on

" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set updatetime=300
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" let new page occurred at right or below
set splitright
set splitbelow

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" let italic enable
" Ref: https://askubuntu.com/a/514524
set t_ZH=[3m
set t_ZR=[23m
" Weird char 001B[>4;m 001B[>4;2m
" Ref: https://stackoverflow.com/a/62150215/6734174
let &t_TI = ""
let &t_TE = ""
" Show those damn hidden characters
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" let cursor in the middle of screen when entering vim
autocmd VimEnter * :exec "normal! \zz"

" return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line('$') |
            \   exe "normal! g`\"" |
            \ endif

" let history record=1000
set history=1000
" let undo history not be clear after changing buffer
" Ref: https://stackoverflow.com/a/22676189/6734174
let vimDir = '$HOME/.config/nvim/'
let &runtimepath .= ',' . vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    silent! call mkdir(myUndoDir, 'p')
    let &undodir = myUndoDir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
" --- backup ---
" nobackup + writebackup = backup current file, deleted afterwards (default)
" no backup
set nobackup
" write into backup file
set writebackup
" not use swap file
set noswapfile

" not auto comment when changing line
" Ref: http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" --- tab ---
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Allow the cursor to move just past the end of the line
set virtualedit=onemore

" show detailed mode
set showmode

" let labels not auto indent
set cinoptions+=L0

" auto change directory
"set autochdir

" auto update if file changed in other way
set autoread
autocmd FileChangedShellPost *
            \ redraw | echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
function! Fresh(arg) abort
    " Ref: https://vi.stackexchange.com/a/14317
    if !bufexists("[Command Line]") | checktime | endif
endfunction
let timer = timer_start(5000,  'Fresh', {'repeat': -1})

" igonre file
set wildignore+=*.o,*.obj,*.pyc
let mapleader = " "
set mouse=a

" =============================================================================
"  # Pugins
" =============================================================================
call plug#begin()
" Load plugins
" Theme
Plug 'chriskempson/base16-vim'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'Yggdroot/indentLine'
Plug 'aben20807/vim-commenter'
Plug 'aben20807/vim-runner'

" GUI enhancements
Plug 'itchyny/vim-gitbranch'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'preservim/tagbar' , {'do': 'unictags -R -h \".h .c .hpp .cpp .java .python .y .l .rs\"'}

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = 
            \ ['coc-clangd', 'coc-pyright', 'coc-rust-analyzer', 'coc-explorer', 'coc-snippets', 'coc-word', 'coc-git']

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'

" Git
Plug 'aben20807/committia.vim'

call plug#end()
" =============================================================================
" # Plugin Setting
" =============================================================================
" --- neoclide/coc.nvim ---
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <expr> <DOWN> pumvisible() ? "\<C-n>" : ""
inoremap <expr> <UP> pumvisible() ? "\<C-p>" : ""
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader> rn <Plug>(coc-rename)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Implement methods for trait
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>
nnoremap <C-n> :CocCommand explorer<CR>

" coc-git
function! s:update_git_status()
  let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
endfunction
let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
autocmd User CocGitStatusChange call s:update_git_status()

" <leader>s for Rg search
" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
    set grepprg=ag\ --nogroup
endif
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <leader>p :<C-u>Files<CR>
let g:fzf_layout = { 'down': '~20%' }
" The Silver Searcher (ag)
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)

" --- majutsushi/tagbar ---
let g:tagbar_map_nexttag = "<C-o>"
nnoremap <C-t> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/unictags'

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" --- Yggdroot/indentLine ---
let g:indentLine_setColors = 0
" let g:indentLine_setConceal = 0
au BufRead,BufEnter,BufNewFile *.md :let g:indentLine_setConceal = 0
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '__Tag_List__']
let g:indentLine_fileTypeExclude = ['help', 'text']
nnoremap <F3> :IndentLinesToggle<CR>

let g:commenter_n_key = "<C-j>"
let g:commenter_i_key = "<C-j>"
let g:commenter_v_key = "<C-j>"

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

" =============================================================================
" # Key
" =============================================================================
" Jump to start and end of line using the home row keys
nnoremap H ^
nnoremap L $l

" move screen
" Ref: https://stackoverflow.com/questions/3458689/how-to-move-screen-without-moving-cursor-in-vim
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
inoremap <silent> <UP> <C-o><C-y>
inoremap <silent> <DOWN> <C-o><C-e>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" move more steps
nnoremap <M-h> 5h
nnoremap <M-j> 5j
nnoremap <M-k> 5k
nnoremap <M-l> 5l
vnoremap <M-h> 5h
vnoremap <M-j> 5j
vnoremap <M-k> 5k
vnoremap <M-l> 5l

" indent
nmap < <<
nmap > >>
vnoremap < <gv
vnoremap > >gv

" cancel highlight after searching
noremap <M-n> :noh<CR>

" search select text by pressing // in visual mode
" Ref: http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" map ctrl-a to select whole text
nnoremap <C-a> ggVG

" buffer map
for i in range(1, 9)
    exec 'noremap <Leader>'.i.' :'.i.'b!<CR>'
endfor

" show line numbers, use <F2> to switch
nnoremap <F2> :set norelativenumber!<CR>:set nonumber!<CR>
set number
set relativenumber

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>
set invlist

" background vim
inoremap <C-z> <C-o><C-z>

" move among split pages
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>n <C-w>j

" move split window
nnoremap <C-S-Right> <C-w>L
nnoremap <C-S-Left>  <C-w>H
nnoremap <C-S-Up>    <C-w>K
nnoremap <C-S-Down>  <C-w>J

" change splite window size
nnoremap <M-+> <C-w>10>
nnoremap <M--> <C-w>10<
nnoremap <M-=> <C-w>=
nnoremap <M-_> <C-w>30><C-w>30+

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

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

" Automatically create parent directories
" Ref: https://stackoverflow.com/a/4294176/6734174
"function! s:MkNonExDir(file, buf)
"    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
"        let dir=fnamemodify(a:file, ':h')
"        if !isdirectory(dir)
"            silent call mkdirexpand('%:h'), 'p')
"        endif
"    endif
"endfunction
function! WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command W :call WriteCreatingDirs()

" --- other important function ---
" eat char c if c is one member of pat
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat)? '': c
endfunction

" TMUX key
" Ref: https://superuser.com/a/402084
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev Q q
cnoreabbrev db bd

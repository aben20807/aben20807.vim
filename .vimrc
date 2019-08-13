" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .vimrc
" Last Modified: 2019-08-13 15:09:05
" Vim: enc=utf-8

if exists("g:has_loaded_aben20807")
    finish
endif
if v:version < 700
    echoerr "These settings and plugins require vim >= 7."
    finish
endif
let g:has_loaded_aben20807 = 1

let g:browser = 0           " 0 for chrome in cygwin, 1 for firefox in ubuntu
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
let g:airline_theme = 'ouo'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-o>' "選中一個
let g:multi_cursor_prev_key = '<C-p>' "放棄一個，回到
let g:multi_cursor_skip_key = '<C-x>' "跳過
let g:multi_cursor_select_all_key = '<M-o>'
let g:multi_cursor_quit_key = '<Esc>' "退出
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim', { 'for': 'rust'}
if v:version >= 800
    Plug 'w0rp/ale'
    Plug 'maralla/completor.vim'
endif
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'pseewald/vim-anyfold'
Plug 'majutsushi/tagbar', {'do': 'unictags -R -h \".h .c .hpp .cpp .java .py\"'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'itchyny/vim-cursorword'
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'junegunn/vim-easy-align'
Plug 'hdima/python-syntax'
let python_highlight_all = 1
Plug 'rlue/vim-barbaric'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
let g:goyo_height = 90
Plug 'rhysd/committia.vim'

Plug 'aben20807/aben20807.vim'
Plug 'aben20807/vim-commenter'
Plug 'aben20807/vim-surrounder'
Plug 'aben20807/vim-runner'
let g:runner_is_with_ale = 1
let g:runner_is_with_md = 1
let g:runner_auto_remove_tmp = 1
" let g:runner_cpp_compile_options = "-std=c++14 -Wall -lm -O2 -pipe"
" let g:runner_cpp_run_options = "< test.in"
" let g:runner_cpp_run_options = "< test.in > test.out"
call plug#end()
filetype plugin indent on    " required

" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .vimrc
" Last Modified: 2019-10-21 10:28:07
" Vim: enc=utf-8

if exists("g:has_loaded_aben20807")
    finish
endif
if v:version < 700
    echoerr "These settings and plugins require vim >= 7."
    finish
endif
let g:has_loaded_aben20807 = 1

let g:browser = 1           " 0 for chrome in cygwin, 1 for firefox in ubuntu
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" --- Theme ---
Plug 'vim-airline/vim-airline'
let g:airline_theme = 'ouo'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'pseewald/vim-anyfold'
Plug 'itchyny/vim-cursorword'
Plug 'andymass/vim-matchup'

" --- Tool ---
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar', {'do': 'unictags -R -h \".h .c .hpp .cpp .java .python .y .l\"'}
let g:tagbar_ctags_bin = '/usr/local/bin/unictags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
if v:version >= 800
    " Plug 'w0rp/ale'
    Plug 'maralla/completor.vim'
endif
Plug 'mg979/vim-visual-multi'
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-o>'
let g:VM_maps['Find Subword Under'] = '<C-o>'
let g:VM_silent_exit = 1

" --- Syntax ---
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra', {'for': ['c', 'lex', 'yacc']}
Plug 'hdima/python-syntax'
let python_highlight_all = 1
Plug 'rust-lang/rust.vim', { 'for': 'rust'}

" --- Markdown ---
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'rlue/vim-barbaric', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
let g:goyo_height = 90

" --- Git ---
Plug 'rhysd/committia.vim'

" --- Vim test ---
Plug 'junegunn/vader.vim', { 'for': 'vader' }

" --- aben20807 ---
Plug 'aben20807/aben20807.vim'
" Plug '/home/ben/pro/selfpro/aben20807.vim'
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

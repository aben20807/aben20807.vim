" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .vimrc
" Last Modified: 2018-07-22 10:08:17
" Vim: enc=utf-8

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
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim', { 'for': 'rust'}
Plug 'maralla/completor.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'pseewald/vim-anyfold'
Plug 'majutsushi/tagbar', {'do': 'ctags -R -h \".h .c .hpp .cpp .java\"'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'aben20807/aben20807.vim'
Plug 'aben20807/vim-commenter'
Plug 'aben20807/vim-surrounder'
Plug 'aben20807/vim-runner'
let g:runner_is_with_ale = 1
let g:runner_is_with_md = 1
let g:runner_auto_remove_tmp = 1
let g:runner_cpp_compile_options = "-std=c++14 -Wall -lm -O2 -pipe"
" let g:runner_cpp_run_options = "< test.in"
" let g:runner_cpp_run_options = "< test.in > test.out"

call plug#end()
filetype plugin indent on    " required

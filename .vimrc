" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .vimrc
" Last Modified: 2017-10-27 21:54:33
" Vim: enc=utf-8

let g:browser = 0           " 0 for chrome in cygwin, 1 for firefox in ubuntu
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'vim-airline/vim-airline'
let g:airline_theme='ouo'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=1
let g:multi_cursor_next_key='<C-o>' "選中一個
let g:multi_cursor_prev_key='<C-p>' "放棄一個，回到
let g:multi_cursor_skip_key='<C-x>' "跳過
let g:multi_cursor_quit_key='<Esc>' "退出
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'maralla/completor.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
Plug 'pseewald/vim-anyfold'
Plug 'vim-scripts/taglist.vim', {'do': 'ctags -R -h \".h .c .hpp .cpp .java\"'}
Plug 'aben20807/aben20807.vim'

call plug#end()
filetype plugin indent on    " required

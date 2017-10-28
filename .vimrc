" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .vimrc
" Last Modified: 2017-10-27 21:54:33
" Vim: enc=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Yggdroot/indentLine'
Plugin 'w0rp/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'maralla/completor.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'aben20807/aben20807.vim'

call vundle#end()            " required
filetype plugin indent on    " required

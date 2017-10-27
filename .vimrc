set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
let g:indentLine_setColors = 0
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
nnoremap <F3> :IndentLinesToggle<CR>

Plugin 'aben20807/aben20807.vim'

call vundle#end()            " required
filetype plugin indent on    " required

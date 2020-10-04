" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: ouo.vim
" Last Modified: 2019-08-13 15:43:57
" URL: https://github.com/aben20807/aben20807.vim/blob/master/colors/ouo.vim
" Version:  $Id: ouo.vim,v 1.0 fugalh Exp $
" Inspired: desert
"
" Vim color file
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="ouo"

" color terminal definitions
if &t_Co > 255
    hi Comment          ctermfg=238 cterm=italic    "註解

    hi Constant         ctermfg=251                 "
    hi String           ctermfg=251                 "字串
    hi Character        ctermfg=251                 "字元
    hi Number           ctermfg=251                 "數字
    hi Boolean          ctermfg=251                 "true or false
    hi Float            ctermfg=251                 "浮點數

    hi Identifier       cterm=NONE ctermfg=251     "print in python, variable
    hi Function         ctermfg=33                 "function in python, main in rust

    hi Statement        ctermfg=33                  "using, for, if, return
    hi Conditional      ctermfg=33                  "if else switch
    hi Repeat           ctermfg=33                  "for while do
    hi Label            ctermfg=33                  "case: default:
    hi Operator         ctermfg=251                 "- = ==
    hi Keyword          ctermfg=33                  "fn in rust
    hi Exception        ctermfg=33                  "try catch throw

    hi PreProc          ctermfg=33                  "#include, #define
    hi Include          ctermfg=33                  "#include
    hi Define           ctermfg=green
    hi Macro            ctermfg=172                 "#define, println! in rust
    hi PreCondit        ctermfg=33                  "#ifdef #endif

    hi Type             ctermfg=172                 "型態 int, char
    hi StorageClass     ctermfg=172                 "static const
    hi Structure        ctermfg=172                 "struct, class, typedef, namespace
    hi Typedef          ctermfg=172                 "vector, string

    hi Special          ctermfg=172                 "Esc CR
    hi SpecialChar      cterm=bold ctermfg=160      "\n
    hi Tag              ctermfg=green
    hi Delimiter        ctermfg=251                 "(), <> for function
    hi SpecialComment   ctermfg=red
    hi Debug            ctermfg=9                   "echo debug

    hi Underlined       cterm=underline ctermfg=13

    hi Ignore           ctermfg=238

    hi Error            cterm=bold ctermfg=7 ctermbg=1

    hi Todo             cterm=bold ctermfg=135 ctermbg=NONE     "TODO, FIXME, XXX

    hi ColorColumn      ctermfg=251 ctermbg=237     "textwidth
    hi Conceal          ctermfg=2 ctermbg=NONE
    hi Cursor           cterm=reverse
    hi CursorIM         cterm=reverse
    hi CursorColumn     cterm=reverse
    hi CursorLine       cterm=underline
    hi Directory        ctermfg=172                 "NERDtree 資料夾
    hi DiffAdd          cterm=NONE ctermbg=22
    hi DiffAdded        cterm=NONE ctermfg=40 ctermbg=NONE
    hi DiffChange       cterm=NONE ctermbg=NONE
    hi DiffRemoved      cterm=NONE ctermfg=160 ctermbg=NONE
    hi DiffDelete       cterm=NONE ctermfg=196 ctermbg=52
    hi DiffText         cterm=NONE ctermbg=240
    hi ErrorMsg         cterm=bold ctermfg=7 ctermbg=1
    hi VertSplit        cterm=reverse
    hi Folded           ctermfg=darkgrey ctermbg=NONE
    hi FoldColumn       ctermfg=darkgrey ctermbg=NONE
    hi SignColumn       cterm=NONE ctermbg=NONE     "語法檢查通過行
    hi IncSearch        cterm=NONE ctermfg=0 ctermbg=172
    hi LineNr           ctermfg=245                 "行號
    hi CursorLineNr     cterm=bold ctermfg=11                  "目前行號
    hi MatchParen       cterm=NONE ctermfg=11 ctermbg=0 "配對的括號
    hi ModeMsg          cterm=NONE ctermfg=brown
    hi MoreMsg          ctermfg=135                 "--尚有--
    hi NonText          cterm=NONE ctermfg=245      "最後一行以下的~
    hi Normal           ctermfg=251                 "其他內容
    hi Pmenu            cterm=NONE ctermfg=233 ctermbg=240
    hi PmenuSel         cterm=NONE ctermfg=251 ctermbg=236
    hi PmenuSbar        cterm=NONE ctermbg=240
    hi PmenuThumb       ctermfg=green
    hi Question         ctermfg=238                 "Press ENTER or type command to continue
    hi Search           cterm=NONE ctermfg=0 ctermbg=11
    hi SpecialKey       ctermfg=245                 "對齊符號
    if has("spell")
        hi SpellBad    cterm=bold ctermfg=251 ctermbg=88
        hi SpellCap    guisp=#7070F0 gui=undercurl
        hi SpellLocal  guisp=#70F0F0 gui=undercurl
        hi SpellRare   guisp=#FFFFFF gui=undercurl
    endif
    hi StatusLine       cterm=bold
    hi StatusLineNC     cterm=reverse
    hi TabLine          cterm=reverse
    hi TabLineFill      cterm=reverse
    hi TabLineSel       cterm=reverse
    hi Title            ctermfg=135                 "markdown header
    hi Visual           cterm=bold,reverse          "選取
    hi VisualNOS        cterm=bold,underline
    hi WarningMsg       cterm=bold ctermfg=1
    hi WildMenu         ctermfg=0 ctermbg=11
endif

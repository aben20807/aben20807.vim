" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: .comment.vim
" Last Modified: 2017-08-02 10:35:34
" Vim: enc=utf-8

" Section: 記錄原始key map
" Comment map
" nmap <M-/> <ESC><S-^>i// <ESC>
" imap <M-/> <ESC><S-^>i// <ESC><BS>i
" vmap <M-/> <S-^><C-v><S-i>// <ESC>
" nmap <M-.> <ESC><S-^><C-V>lld
" imap <M-.> <ESC><S-^><C-V>lldi
" vmap <M-.> <C-v><S-^><S-o><S-^>lld<ESC>

" Function: CommentFormat() function
" 接收註解格式, 請於.vim/after/ftplugin/ouo.vim設定
" 例如在.vim/after/ftplugin/cpp.vim中打call CommentFormat("// ")
"
" Args:
"   -format:註解格式, 例如cpp是// , python是# ,請以雙引號刮起
function CommentFormat(format)
    let s:format = a:format
endfunction


" Function: s:subString() function
" 用於提出整行的子字串, 長度根據註解格式長度
"
" Return:
"   -result:裁減完成的子字串
function s:subString(from, to)
    let currentLine = getline(".")
    let i = a:from
    let result = ""
    while i < a:to
        let result .= currentLine[i]
        let i+=1
    endwhile
    return result
endfunction


" Function: s:isComment() function
" 用於判斷游標所在行是否已經註解
"
" Return:
"   -1代表前方有註解符號, 否則回傳0, -1代表沒有設定則不給註解
function s:isComment()
    if !exists("s:format")
        redraw
        echohl WarningMsg
            echo "   ❖  無設定註解格式 ❖ "
        echohl NONE
        return -1
    endif
    let s:nowcol = col(".")
    execute "normal \<S-^>"
    let sub = s:subString(col(".")-1, col(".")-1+strlen(s:format))
    execute "normal 0".(s:nowcol)."lh"
    if  sub ==# s:format
        " redraw
        " echohl WarningMsg
        "     echo "   ❖  有註解 ❖ "
        " echohl NONE
        return 1
    else
        " redraw
        " echohl WarningMsg
        "     echo "   ❖  無註解 ❖ "
        " echohl NONE
        return 0
    endif
endfunction


" Function: s:comment() function
" i, n模式下的註解
" 先判斷是否已經註解, 原無註解則加上註解, 否則移除註解
function s:comment()
    let s:nowcol = col(".")
    if s:isComment() ==# 1
        call s:commentDel()
        execute "normal 0".(s:nowcol - strlen(s:format) > 0? (s:nowcol - strlen(s:format)): 0)."lh"
    elseif s:isComment() ==# 0
        call s:commentAdd()
        execute "normal 0".(s:nowcol + strlen(s:format))."lh"
    endif
endfunction


" Function: s:commentAdd() function
" i, n模式下的加入註解
function s:commentAdd()
    execute "normal \<S-^>i".s:format."\<ESC>"
    redraw
    echohl WarningMsg
        echo "   ❖  加入註解 ❖ "
    echohl NONE
endfunction


" Function: s:commentDel() function
" i, n模式下的移除註解
function s:commentDel()
    execute "normal \<S-^>".strlen(s:format)."x"
    redraw
    echohl WarningMsg
        echo "   ❖  移除註解 ❖ "
    echohl NONE
endfunctio


" Function: s:commentV() function
" v模式下的註解, 可多行同時註解
" 先判斷是否已經註解, 原無註解則加上註解, 否則移除註解
function s:commentV()
    " FIXME 游標無法回到註解前的位置
    " FIXME 註解不註解只能以第一行當作判斷
    " FIXME v-block模式會錯誤
    if s:isComment() ==# 1
        call s:commentVDel()
    elseif s:isComment() ==# 0
        call s:commentVAdd()
    endif
endfunction


" Function: s:commentVAdd() function
" v模式下的加入註解
function s:commentVAdd()
    execute "normal gv \<C-v>\<S-^>\<S-o>\<S-^>I".s:format."\<ESC>"
    redraw
    echohl WarningMsg
        echo "   ❖  加入註解 ❖ "
    echohl NONE
endfunction


" Function: s:commentVDel() function
" v模式下的移除註解
function s:commentVDel()
    " FIXME 遇到非註解開頭的仍會刪掉
    execute "normal gv \<C-v>\<S-^>\<S-o>\<S-^>".(strlen(s:format)-1)."lx\<ESC>"
    redraw
    echohl WarningMsg
        echo "   ❖  移除註解 ❖ "
    echohl NONE
endfunctio


" Section: key map設定
nnoremap <silent> <Plug>Comment :<C-u>call <SID>comment()<CR>
nmap <M-/> <Plug>Comment
inoremap <silent> <Plug>Comment :<C-u>call <SID>comment()<CR>
imap <M-/> <ESC> <Plug>Comment hi
vnoremap <silent> <Plug>Comment :<C-u>call <SID>commentV()<CR>
vmap <M-/> <Plug>Comment

" Author: Huang Po-Hsuan <aben20807@gmail.com>
" Filename: surround.vim
" Last Modified: 2018-01-24 18:25:01
" Vim: enc=utf-8

let s:patlist=["'", '"', '(', '[', '{', '<']

function! s:mapBrackets(pat)
    if a:pat ==# "'"
        return "'"
    elseif a:pat ==# '"'
        return '"'
    elseif a:pat ==# '{'
        return '}'
    elseif a:pat ==# '['
        return ']'
    elseif a:pat ==# '('
        return ')'
    elseif a:pat ==# '<'
        return '>'
    endif
endfunction


function! s:isBrackets(pat)
    for c in s:patlist
        if a:pat ==# c
            return 1
        endif
    endfor
    redraw
    echohl WarningMsg
        echo "   ❖  不支援字元".a:pat." ❖ "
    echohl NONE
    return 0
endfunction


function! s:isInSurround(pat)
    let nofound = 0
    let s:nowcol = col(".")
    execute "normal F".a:pat
    if matchstr(getline('.'), '\%' . col('.') . 'c.') !=# a:pat
        " Ref: https://stackoverflow.com/questions/23323747/vim-vimscript-get-exact-character-under-the-cursor
        let nofound = 1
    endif
    let leftcol=col(".")
    execute "normal f".s:mapBrackets(a:pat)
    if matchstr(getline('.'), '\%' . col('.') . 'c.') !=# s:mapBrackets(a:pat)
        let nofound = 1
    endif
    let rightcol=col(".")
    if nofound ==# 0 && leftcol <= s:nowcol && rightcol >= s:nowcol && leftcol !=# rightcol
        return 1
    endif
    redraw
    echohl WarningMsg
        echo "   ❖  沒有在".a:pat.s:mapBrackets(a:pat)."裡喔 ❖ "
    echohl NONE
    " recover sorcur position
    execute "normal 0".(s:nowcol)."lh"
    return 0
endfunction


function! s:saveMap(pat)
    let s:save=maparg(a:pat, 'i')
    " exec 'iunmap ' . a:pat if there is no map it will be error
    execute 'inoremap ' . a:pat . ' ' . a:pat
endfunction


function! s:restoreMap(pat)
    execute 'inoremap ' . a:pat . ' ' . s:save
endfunction


function! s:surround(num, pat)
    " check is can delete
    if s:isBrackets(a:pat) ==# 0
        return
    endif
    call s:saveMap(a:pat)
    execute "normal viw\<ESC> bi".a:pat
    for i in range(a:num)
        execute "normal e"
    endfor
    execute "normal a".s:mapBrackets(a:pat)
    call s:restoreMap(a:pat)
    redraw
    echohl WarningMsg
        echo "   ❖  加入".a:pat.s:mapBrackets(a:pat)." ❖ "
    echohl NONE
endfunction


function! s:surroundNadd(num)
    let pat = nr2char(getchar())
    call s:surround(a:num, pat)
endfunction


function! s:surroundVadd(vmode)
    " Ref: https://stackoverflow.com/questions/29091614/vim-determine-if-function-called-from-visual-block-mode
    " FIXME v 模式多行最後會多一個字元
    " FIXME V 模式往上選會把上面當成尾端
    " FIXME v 模式往前選會括錯
    let pat = nr2char(getchar())
    " check is can be added
    if s:isBrackets(pat) ==# 0
        return
    endif
    let s:nowcol = col(".")
    call s:saveMap(pat)
    if a:vmode ==# 'v'
        execute "normal gvO\<ESC> hi".pat
        execute "normal gvO\<ESC> a".s:mapBrackets(pat)."\<ESC>"
    elseif a:vmode ==# 'V'
        execute "normal gvO\<ESC> I".pat
        execute "normal gvO\<ESC> A".s:mapBrackets(pat)."\<ESC>"
    else
        execute "normal gvOI".pat
        execute "normal gvlOlA".s:mapBrackets(pat)."\<ESC>"
    endif
    call s:restoreMap(pat)
    redraw
    echohl WarningMsg
        echo "   ❖  加入".pat.s:mapBrackets(pat)." ❖ "
    echohl NONE
    " recover sorcur position
    execute "normal 0".(s:nowcol)."lhf".pat
endfunction


function! s:surroundNdel()
    let pat = nr2char(getchar())
    " check is can be deleted
    if s:isBrackets(pat) ==# 0
        return
    endif
    if s:isInSurround(pat) ==# 0
        return
    endif
    " delete
    execute "normal F".pat."xf".s:mapBrackets(pat)."x"
    " recover sorcur position
    execute "normal 0".(s:nowcol)."lhh"
    redraw
    echohl WarningMsg
       "  echo s:nowcol." ".leftcol." ".rightcol
        echo "   ❖  刪除".pat.s:mapBrackets(pat)." ❖ "
    echohl NONE
endfunction


function! s:surroundNrep()
    let pat1 = nr2char(getchar())
    let pat2 = nr2char(getchar())
    " check is can be deleted
    if s:isBrackets(pat1) ==# 0
        return
    endif
    if s:isBrackets(pat2) ==# 0
        return
    endif
    if s:isInSurround(pat1) ==# 0
        return
    endif
    " replace
    execute "normal F".pat1."r".pat2."f".s:mapBrackets(pat1)."r".s:mapBrackets(pat2)
    " recover sorcur position
    execute "normal 0".(s:nowcol)."lh"
    echohl WarningMsg
       "  echo s:nowcol." ".leftcol." ".rightcol
        echo "   ❖  取代".pat1.s:mapBrackets(pat1)."為".pat2.s:mapBrackets(pat2)." ❖ "
    echohl NONE
endfunction


command! -nargs=+ S call s:surround(<f-args>)
nnoremap <silent> <Plug>SurroundNadd :<C-u>call <SID>surroundNadd(v:count1)<CR>
vnoremap <silent> <Plug>SurroundVadd :<C-u>call <SID>surroundVadd(visualmode())<CR>
nmap <leader>s <Plug>SurroundNadd
vmap <leader>s <Plug>SurroundVadd

nnoremap <silent> <Plug>SurroundNdel :<C-u>call <SID>surroundNdel()<CR>
nmap <leader>d <Plug>SurroundNdel

nnoremap <silent> <Plug>SurroundNrep :<C-u>call <SID>surroundNrep()<CR>
nmap <leader>f <Plug>SurroundNrep

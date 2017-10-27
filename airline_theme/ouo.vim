" ouo palette
" modified from murmur and fresh
let g:airline#themes#ouo#palette = {}

" Color palette
let s:cterm_termbg    = 237         " Background for branch and file format blocks
let s:gui_termbg      = '#5F5F5F'
let s:cterm_termfg    = 144         " Foreground for branch and file format blocks
let s:gui_termfg      = '#AFAF87'

let s:cterm_termbg2   = 234         " Background for middle block
let s:gui_termbg2     = '#1C1C1C'
let s:cterm_termfg2   = 39          " Foreground for middle block
let s:gui_termfg2     = '#F5F5F5'

let s:cterm_normalbg  = 27          " Background for normal mode and file position blocks
let s:gui_normalbg    = '#5F87FF'
let s:cterm_normalfg  = 15          " Foreground for normal mode and file position blocks
let s:gui_normalfg    = '#FFFFFF'

let s:cterm_insertbg  = 70          " Background for insert mode and file position blocks
let s:gui_insertbg    = '#87AF5F'
let s:cterm_insertfg  = 15          " Foreground for insert mode and file position blocks
let s:gui_insertfg    = '#FFFFFF'

let s:cterm_visualbg  = 166         " Background for visual mode and file position blocks
let s:gui_visualbg    = '#FF8C00'
let s:cterm_visualfg  = 15          " Foreground for visual mode and file position blocks
let s:gui_visualfg    = '#FFFFFF'

let s:cterm_replacebg = 160         " Background for replace mode and file position blocks
let s:gui_replacebg   = '#D70000'
let s:cterm_replacefg = 15          " Foreground for replace mode and file position blocks
let s:gui_replacefg   = '#FFFFFF'

let s:cterm_alert     = 124         " Modified file alert color
let s:gui_alert       = '#AF0000'

let s:cterm_warningbg = 166         " Background for warning blocks
let s:gui_warningbg   = '#FF8C00'
let s:cterm_warningfg = 15          " Foreground for warning blocks
let s:gui_warningfg   = '#FFFFFF'
let s:cterm_errorbg   = 160           " Background for error blocks
let s:gui_errorbg     = '#D70000'
let s:cterm_errorfg   = 15            " Foreground for error blocks
let s:gui_errorfg     = '#FFFFFF'

let s:cterm_inactivebg = 234        " Background for inactive mode
let s:gui_inactivebg   = '#1C1C1C'
let s:cterm_inactivefg = 239        " Foreground for inactive mode
let s:gui_inactivefg   = '#4E4E4E'

" Branch and file format
let s:BB = [s:gui_termfg, s:gui_termbg, s:cterm_termfg, s:cterm_termbg] " Branch and file format blocks

" Warning and error format
let s:W = [s:gui_warningfg, s:gui_warningbg, s:cterm_warningfg, s:cterm_warningbg, 'bold']
let s:E = [s:gui_errorfg, s:gui_errorbg, s:cterm_errorfg, s:cterm_errorbg, 'bold']

" NORMAL mode
let s:N1 = [s:gui_normalfg, s:gui_normalbg, s:cterm_normalfg, s:cterm_normalbg] " Outside blocks in normal mode
let s:N2 = s:BB
let s:N3 = [s:gui_termfg2, s:gui_termbg2, s:cterm_normalbg, s:cterm_termbg2]     " Middle block
let g:airline#themes#ouo#palette.normal =
    \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#ouo#palette.normal.airline_warning = s:W
let g:airline#themes#ouo#palette.normal.airline_error = s:E
let g:airline#themes#ouo#palette.normal_modified = {
    \ 'airline_c': [s:gui_alert, s:gui_termbg2, s:cterm_alert, s:cterm_termbg2, 'bold'],
    \ 'airline_warning': s:W,
    \ 'airline_error': s:E}

" INSERT mode
let s:I1 = [s:gui_insertfg, s:gui_insertbg, s:cterm_insertfg, s:cterm_insertbg] " Outside blocks in insert mode
let s:I2 = s:BB
let s:I3 = [s:gui_insertbg, s:gui_termbg2, s:cterm_insertbg, s:cterm_termbg2]   " Middle block
let g:airline#themes#ouo#palette.insert =
    \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#ouo#palette.insert.airline_warning = s:W
let g:airline#themes#ouo#palette.insert.airline_error = s:E
let g:airline#themes#ouo#palette.insert_modified =
    \ g:airline#themes#ouo#palette.normal_modified

" REPLACE mode
let s:R1 = [s:gui_replacefg, s:gui_replacebg, s:cterm_replacefg, s:cterm_replacebg]  " Outside blocks in replace mode
let s:R2 = s:BB            " Middle block
let s:R3 = [s:gui_termfg, s:gui_termbg2, s:cterm_termfg, s:cterm_termbg2]            " Middle block
let g:airline#themes#ouo#palette.replace =
    \airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#ouo#palette.replace.airline_warning = s:W
let g:airline#themes#ouo#palette.replace.airline_error = s:E
let g:airline#themes#ouo#palette.replace_modified =
    \ g:airline#themes#ouo#palette.normal_modified

" VISAUL mode
let s:V1 = [s:gui_visualfg, s:gui_visualbg, s:cterm_visualfg, s:cterm_visualbg] " Outside blocks in visual mode
let s:V2 = s:BB
let s:V3 = [s:gui_visualbg, s:gui_termbg2, s:cterm_visualbg, s:cterm_termbg2]   " Middle block
let g:airline#themes#ouo#palette.visual =
    \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#ouo#palette.visual.airline_warning = s:W
let g:airline#themes#ouo#palette.visual.airline_error = s:E
let g:airline#themes#ouo#palette.visual_modified =
    \ g:airline#themes#ouo#palette.normal_modified

" INACTIVE mode
let s:IA1 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA2 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA3 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let g:airline#themes#ouo#palette.inactive =
    \ airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#ouo#palette.inactive.airline_warning = s:IA2
let g:airline#themes#ouo#palette.inactive.airline_error =  s:IA2
let g:airline#themes#ouo#palette.inactive_modified =
    \ g:airline#themes#ouo#palette.normal_modified

let g:airline#themes#ouo#palette.accents = {
    \ 'red': [ '#ff0000' , '' , 160 , ''  ] }

" CtrlP plugin colors
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#murmur#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
    \ [s:gui_normalfg, s:gui_normalbg, s:cterm_normalfg, s:cterm_normalbg, ''],
    \ [s:gui_termfg, s:gui_termbg, s:cterm_termfg, s:cterm_termbg, ''],
    \ [s:gui_termfg2, s:gui_termbg2, s:cterm_termfg2, s:cterm_termbg2, 'bold'])

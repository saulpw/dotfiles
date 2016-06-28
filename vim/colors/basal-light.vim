" Vim color scheme                           
" Name: basal-light
" Author: Jethro Van Thuyne <post@jethro.be>
" Version: 1.0.0
" Last Change: 2016 June 14

hi clear
syntax reset
let g:colors_name = "basal-light"

hi Normal ctermfg=000 ctermbg=255
hi Comment ctermfg=241 
hi Constant ctermfg=161 ctermbg=254
hi String ctermfg=162 cterm=NONE
hi Statement ctermfg=000 cterm=NONE
hi Type ctermfg=106 cterm=NONE
hi Identifier ctermfg=61 cterm=NONE
hi PreProc ctermfg=61 cterm=NONE
hi makeCommands ctermfg=000
hi makeSpecial ctermfg=208
hi LineNr ctermfg=245

hi FoldColumn term=NONE cterm=NONE ctermbg=NONE 
hi VertSplit cterm=NONE ctermfg=240
hi StatusLine   cterm=NONE ctermfg=168 ctermbg=254 cterm=bold
hi StatusLineNC cterm=NONE ctermfg=240 ctermbg=253

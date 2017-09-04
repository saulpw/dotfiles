set t_Co=256
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" todo list
"Plugin 'davidoc/taskpaper.vim'

"Navigate to the window you'd like to move
"Press <leader>ww
"Navigate to the window you'd like to swap with
"Press <leader>ww again
Plugin 'wesQ3/vim-windowswap'

" tag management
"Plugin 'taglist.vim'
"Plugin 'majutsushi/tagbar'

" put tagbar on left
"let g:tagbar_left = 1

" close after tag selection
"noremap <Leader>T :TagbarOpenAutoClose<cr>
"noremap <Leader><C-T> :tl<cr>

" status line
"Plugin 'bling/vim-airline'
"Plugin 'powerline/powerline'

" colorschemes
" Plugin 'qualiabyte/vim-colorstepper'

" git
"Plugin 'tpope/vim-fugitive'

" vertical split for Gdiff by default
set diffopt+=vertical

command Gdiffs cexpr system('git diff \| diff-hunk-list.pl')

" [n and ]n pairings
Plugin 'tpope/vim-unimpaired'

"" brackets and quotes
Plugin 'tpope/vim-surround'

" resolve git conflicts
Plugin 'christoomey/vim-conflicted'

" Split navigation that works with tmux
"Plugin 'christoomey/vim-tmux-navigator'

" VimuxRunCommand to create a pane and execute shell command
"Plugin 'benmills/vimux'

" terminal integration: cursor, mouse, focus, paste
Plugin 'wincent/terminus'

" tab completion
"Plugin 'ervandew/supertab'

" show undo tree
"Plugin 'sjl/gundo'

" buffer explorer/browser
Plugin 'jlanzarotta/bufexplorer'
noremap <Leader>b :BufExplorerHorizontalSplit<cr>

" fullscreen vim pane
Plugin 'ZoomWin'

nnoremap <silent> <Leader>f :ZoomWin<CR>

" git status flags in nerdtree
"Plugin 'Xuyuanp/nerdtree-git-plugin'

" <Ctrl-l> redraws the screen and removes any search highlighting.
" nnoremap <silent> <C-l> :nohl<cr>:redraw<cr>

" file explorer
"Plugin 'scrooloose/nerdtree'

" syntax highlighting checks
Plugin 'scrooloose/syntastic'
let g:syntastic_python_pylint_post_args="--max-line-length=120"
nnoremap <C-t> :SyntasticToggleMode<CR>


map <C-n> :NERDTreeToggle<CR>

" split file explorer for nerdtree
"Plugin 'dhruvasagar/vim-vinegar'

" 
"Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()            " required

filetype plugin indent on    " required

map <Leader>I :PluginInstall<cr>

nmap <S-F7> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <M-F7> <Plug>ColorstepReload

" set shell=/bin/zsh

set encoding=utf-8
setglobal fileencoding=utf-8

set showmode
set showcmd
set mouse=a

"set number
"set relativenumber
noremap <Leader># :set number!<cr>

set background=light
colorscheme morning

set whichwrap=h,l,~,[,]
set directory=~/.vim/swp
syntax on

set guioptions=aegirLt
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar

set guifont=Inconsolata\ Medium\ 10

set regexpengine=1

"" Whitespace
set tabstop=4 shiftwidth=4
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

"" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch

"" Custom

map <leader>d :.!date +'--- \%Y-\%b-\%d \%A \%l:\%M\%P'
map <leader>a Gyyp<C-F><leader>d<Enter>A<Enter>

"" Makefiles can have names such as Makefile.rules or TEST.nightly.Makefile
augroup filetype
  au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END


map <space> :
map <cr> <leader>

set tags=./tags;/
" map <C-\> :execute("!gvim -t".expand("<cword>"))<CR><CR>

if has("cscope")
  set csprg=/usr/bin/cscope
  set cscopetagorder=0
  set cscopetag
  set nocscopeverbose
  " add any database in current directory
  if filereadable("cscope.out")
  cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB $HOME/git
  endif
  set cscopeverbose
endif

" reformat a paragraph
nnoremap Q gqap

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
inoremap <C-e> <C-o>$

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

nnoremap <Leader>- :split<cr>
nnoremap <Leader>\| :vsplit<cr>
nnoremap <Leader><Delete> :qall<cr>
nnoremap <Leader><S-Delete> :qall!<cr>

" easy diff
nnoremap <Leader>D :Gdiff<cr>

" make tabs and trailing spaces visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" When you open a file, you can undo changes you made previously
set undofile
set undodir=~/.vim/undo/

command! -nargs=0 DiffOrig leftabove vertical new |
      \ set buftype=nofile |
      \ set bufhidden=wipe |
      \ set noswapfile |
      \ r # |
      \ 0d_ |
      \ let &filetype=getbufvar('#', '&filetype') |
      \ execute 'autocmd BufWipeout <buffer> diffoff!' |
      \ diffthis |
      \ wincmd p |
      \ diffthis

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
" highlight! link DiffText MatchParen

" ^F finds all occurrences of word under cursor
vnoremap <c-f> y<ESC>/<c-r>"<CR>

" to underline entire cursor line
set cursorline

" TEMPLATES
function! LoadTemplate()
    " load a template based on the file extension
    silent! 0r ~/dotfiles/skel.%:e

    " This last one deletes the placeholder
    " %START% then leaves the cursor there.
    %s/%START%//g
endfunction
"autocmd! BufNewFile *.c call LoadTemplate()
"autocmd! BufNewFile *.h call LoadTemplate()
"autocmd! BufNewFile *.py call LoadTemplate()
"autocmd! BufNewFile *.html call LoadTemplate()

" allow vim to resize windows
set ttymouse=xterm2

" usable esc key on some kbs
"inoremap jk <Esc>

set noswapfile
set nobackup
set nowritebackup
if !&diff
  set undodir=~/.vim/undodir
  set undofile
endif

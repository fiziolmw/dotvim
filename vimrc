"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  suggestion for a personal configuration file ~/.vimrc
"       AUTHOR:  Dr.-Ing. Fritz Mehner
"      CREATED:  04.04.2009
"     REVISION:  $Id: customization.vimrc,v 1.6 2009/10/03 12:24:30 mehner Exp $
"===================================================================================
"
"===================================================================================
" GENERAL SETTINGS
"===================================================================================

" Przydatne gdy chcemy otworzyc inny z tego samego katalogu
" " http://vim.sourceforge.net/tip_view.php?tip_id=101
 if has("autocmd")
      autocmd BufEnter * :cd %:p:h
       endif " has("autocmd")
"        " mozna tez uzyc set acd, ale ta opcja nie dziala z pewnymi wtyczkami,
"        zobacz :he acd
"
set nobackup " vim nie bedzie zostawial kopii zapisywanych plikow"

 scriptencoding utf-8
" Get pathogen up and running
filetype off 
call pathogen#infect()
call pathogen#helptags()
"-------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
"-------------------------------------------------------------------------------
set nocompatible
set paste
"
"-------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
"-------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on
"
"-------------------------------------------------------------------------------
" Switch syntax highlighting on.
"-------------------------------------------------------------------------------
syntax    on            
"
"    set backupdir =$HOME/.vim.backupdir
" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=1000                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set mouse=a                     " enable the use of the mouse
set nowrap                      " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
"set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
"-------------------------------------------------------------------------------
"
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error   
"-------------------------------------------------------------------------------
"
map   <silent> <F2>        :write<CR>
map   <silent> <F3>        :Explore<CR>
nmap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>        :copen<CR>
map   <silent> <F6>        :cclose<CR>
map   <silent> <F7>        :cp<CR>
map   <silent> <F8>        :cn<CR>
"
imap  <silent> <F2>   <Esc>:write<CR>
imap  <silent> <F3>   <Esc>:Explore<CR>
imap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>   <Esc>:copen<CR>
imap  <silent> <F6>   <Esc>:cclose<CR>
imap  <silent> <F7>   <Esc>:cp<CR>
imap  <silent> <F8>   <Esc>:cn<CR>
map <S-tab> :tabnext<cr>
set number
" change the mapleader from \ to ,
let mapleader=","
"	możliwia przechodzenie między niezapisanymi buforami
set hidden
set nobackup
set noswapfile
nmap <silent> ,ev :e $MYVIMRC<CR>
" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> ,u~ :t.\|s/./\\~/g\|:nohls<cr>
" Alright... let's try this out
imap jj <esc>
cmap jj <esc>

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
"if has("gui_running")
"  exe "set guifont=" . g:main_font
"  colorscheme xoria256
"  if !exists("g:vimrcloaded")
"    winpos 0 0
"    if !&diff
"      winsize 130 120
"    else
"      winsize 227 120
"    endif
"    let g:vimrcloaded = 1
"  endif
"endif
":nohls

colorscheme blackboard

let g:tex_flavor='pdflatex'
set sw=2
set iskeyword+=:
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:SuperTabDefaultCompletionType = "context"

" ustawienie folderów dla vimwiki
let g:vimwiki_list = [{'path': '~/priv/', 'path_html': '~/public_html/'},
            \ {'path': '~/lab/', 'ext': '.lab','index': 'main'}]

" Highlight matches when jumping to next
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

"function! HLNext (blinktime)
"	set invcursorline
"	redraw
"	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"	set invcursorline
"	redraw
"endfunction
set exrc
set secure
:let g:notes_directories = ['~/.notes', '~/Dropbox/notes']

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set ts=4 sts=4 sw=4 noexpandtab

"	Działania tab  shift-tab przy visual-mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" 	Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

"	przechodzenie między oknami
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"	tab
" for linux and windows users (using the control key)
map <c-tab> :tabnext<cr>
imap <c-tab> <esc>:tabnext<cr>i
map <c-s-tab> :tabprevious<cr>
imap <c-s-tab> <esc>:tabprevious<cr>i
map <c-t> :tabnew<cr>
imap <c-t> <esc>:tabnew<cr>i

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

set wildmenu "nie działa

let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split

"let 'g:netrw_winsize=20

set wrap 
set linebreak 
map 0 g0
map $ g$
map k gk
map j gj

set formatprg=par

" set spell

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
  endif

nmap <leader>c :tabedit $MYVIMRC<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

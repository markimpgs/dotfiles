set nocompatible
set number
set tw=80
set ignorecase
set expandtab
set noshowmode
set splitright
set clipboard+=unnamedplus
set gcr=n:blinkon0              "Disable cursor blink
set noswapfile
set nobackup
set nowb
set autoindent
set smartindent
set smarttab
set expandtab
set encoding=utf8

filetype plugin on
filetype indent on

"cria um esqueleto a partir de um arquivo pre definido
autocmd BufNewFile *.cpp 0r ~/Projetos/testecpp
autocmd BufNewFile *.py 0r ~/Projetos/testepy

" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Python tab format 
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Python tab format 
autocmd FileType cpp set sw=4
autocmd FileType cpp set ts=4
autocmd FileType cpp set sts=4

"ASM tab format
au BufRead,BufNewFile *.asm setlocal textwidth=130
au BufRead,BufNewFile *.asm setlocal ft=pic8
au BufRead,BufNewFile *.asm setlocal sw=4
au BufRead,BufNewFile *.asm setlocal ts=4
au BufRead,BufNewFile *.asm setlocal sts=4
" Pluggins

call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'https://github.com/hail2u/vim-css3-syntax.git'
  Plug 'https://github.com/csscomb/vim-csscomb.git'
  Plug 'https://github.com/ervandew/supertab.git'
  Plug 'othree/html5.vim'
  Plug 'crusoexia/vim-monokai'
  Plug 'Valloric/YouCompleteMe'
  Plug 'https://github.com/scrooloose/nerdtree.git'
  Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
  Plug 'alvan/vim-closetag'
  Plug 'https://github.com/jiangmiao/auto-pairs.git'
  Plug 'https://github.com/ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'https://github.com/kien/ctrlp.vim.git'
  Plug 'veegee/vim-pic'
call plug#end()



" Colors

colorscheme monokai
syntax on
set background=dark
set cursorline
let g:solarized_termcolors=256

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP .'

" Snips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

" Airline
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts =1
let g:airline_theme='badwolf'
let g:airline#extensions#whitespace#enabled =0

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create_left(['branch'])
    let g:airline_section_c = airline#section#create(['%F'])
    let g:airline_section_x = airline#section#create(['%y'])
    let g:airline_section_y = airline#section#create(['%{strftime("%d/%m/%y")}'])
    let g:airline_section_z = airline#section#create(['%{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit()

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" NERDTRee

let NERDTreeIgnore = ['\.pyc$']
"let g:nerdtree_tabs_open_on_console_startup=1

"Key mapping

inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
map <C-n> :NERDTreeTabsToggle<CR>
map <F5> :call PythonRun()<cr>
map <F10> :call HtmlBasic()<cr>
map <F8> :call CppBasic()<cr>
map <F6> :so $MYVIMRC<cr>
nmap <F7> :vsplit <bar> :terminal <cr>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"Add blank line
nnoremap <C-J> m`o<Esc>``
nnoremap <C-K> m`O<Esc>``

"Functions

function! PythonRun()
  if (&filetype=='c')
    vsplit
    vertical
    terminal gcc % -o %:r && ./%:r
  elseif (&filetype=='cpp')
    vsplit
    vertical
    terminal g++ % -o %:r && ./%:r
  elseif (&filetype=='python')
    vsplit
    vertical resize 30
    terminal python %
  endif
endfunction

function! FileHeading()
  let s:line=line(".")
  call setline(s:line,";******************************************************")
  unlet s:line
endfunction

function! HtmlBasic()
  call append(0,"<!DOCTYPE html>")
  call append(1,"<html>")
  call append(2,"<head>")
  call append(3,"    <title></title>")
  call append(4,"<head>")
  call append(5,"<body>")
  call append(6,"    <h1></h1>")
  call append(7,"<body>")
  call append(8,"<html>")
endfunction

function! CppBasic()
        call append(0, "#include <iostream>")
        call append(1, "")
        call append(1, "")
endfunction


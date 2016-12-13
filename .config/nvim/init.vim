" General

set nocompatible
set number
set expandtab
set noshowmode
set splitright
set clipboard=unnamedplus
set gcr=n:blinkon0              "Disable cursor blink
set noswapfile
set nobackup
set nowb
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on


" Pluggins

call plug#begin()
Plug 'https://github.com/freeo/vim-kalisi.git'
Plug 'crusoexia/vim-monokai'
Plug 'git://github.com/tpope/vim-fugitive.git'
Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
Plug 'alvan/vim-closetag'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
call plug#end()


" Colors

colorscheme monokai
syntax on
set background=dark
set cursorline
let g:solarized_termcolors=256


" NERDTRee

let NERDTreeIgnore = ['\.pyc$']
let g:nerdtree_tabs_open_on_console_startup=1


"Key mapping

inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
map <C-n> :NERDTreeTabsToggle<CR>
map <F5> :call PythonRun()<cr>
map <F6> :so $MYVIMRC<cr>
nmap <F7> :vsplit <bar> :terminal make<cr>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"Functions

function! PythonRun()
  if (&filetype=='c')
    vsplit
    vertical
    terminal gcc % -o %:r && ./%:r
  elseif (&filetype=='python')
    vsplit
    vertical resize 30
    terminal python %
  endif
endfunction

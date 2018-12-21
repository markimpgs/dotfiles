set enc=utf-8
set clipboard=unnamed
set number
syntax on
filetype on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Arquivos, backups e desfazer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Desabilita backup
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Texto, tab e indentação
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usa espaço em vez de tab
set expandtab
set smarttab

" 1 tab == 4 espaços
set shiftwidth=4
set tabstop=4

" Quevbra de linha com 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Momimentação
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define <Espaço> para / (Pesquisar) e Ctrl-<Espaço> para ? (Pesquisar para trás)
map <space> /
map <c-space> ?

" Maneira inteligente de mover entre janelas
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Sempre mostrar status line
set laststatus=2
set noshowmode

" Formato da status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Tema Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tender'

inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

call plug#begin('~/.vim/plugged')


Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'

call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme gruvbox
set background=dark

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

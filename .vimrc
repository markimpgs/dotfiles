set enc=utf-8
set clipboard=unnamed
set number
syntax on
filetype on
set backspace=indent,eol,start

"Desabilita setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" Atalho NerdTree
map <C-n> :NERDTreeToggle<CR>

"Pular para o fim da linha no modo edição
inoremap <C-A> <esc>A
inoremap <C-D> <Right>,

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
let g:airline#extensions#capslock#enabled = 1
let g:airline_theme='tender'

"Salvar
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

call plug#begin('~/.vim/plugged')


Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'tpope/vim-endwise'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'

call plug#end()

"UndoTree
nnoremap <F5> :UndotreeToggle<cr>

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

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

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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on


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
call plug#end()



" Colors

colorscheme monokai
syntax on
set background=dark
set cursorline
let g:solarized_termcolors=256

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#whitespace#enabled = 0
let g:ycm_global_ycm_extra_conf ='/home/markim/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create_left(['branch'])
    let g:airline_section_c = airline#section#create(['%F'])
    let g:airline_section_x = airline#section#create(['%y'])
    let g:airline_section_y = airline#section#create(['%{strftime("%d/%m/%y")}'])
    let g:airline_section_z = airline#section#create(['%{strftime("%H:%M")}'])
endfunction
autocmd VimEnter * call AirlineInit()
"
" NERDTRee

let NERDTreeIgnore = ['\.pyc$']
"let g:nerdtree_tabs_open_on_console_startup=1

"Key mapping

inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
map <C-n> :NERDTreeTabsToggle<CR>
map <F5> :call PythonRun()<cr>
map <F8> :call FileHeading()<cr>
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
  call setline(s:line,"//***********************Begin Config**********************")
  call append(s:line,"#pragma config FOSC = XT // Oscillator Selection bits (HS oscillator)")
  call append(s:line+1,"#pragma config WDTE = ON // Watchdog Timer Enable bit (WDT enabled)")
  call append(s:line+2,"#pragma config PWRTE = OFF // Power-up Timer Enable bit (PWRT disabled)")
  call append(s:line+3,"#pragma config BOREN = ON // Brown-out Reset Enable bit (BOR enabled)")
  call append(s:line+4,"#pragma config LVP = OFF // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit")
  call append(s:line+5,"#pragma config CPD = OFF // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)")
  call append(s:line+6,"#pragma config WRT = OFF // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)")
  call append(s:line+7,"#pragma config CP = OFF // Flash Program Memory Code Protection bit (Code protection off)")
  unlet s:line
endfunction

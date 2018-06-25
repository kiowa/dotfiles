set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
" Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'jnurmine/Zenburn'
" Bundle 'Valloric/YouCompleteMe'
" Plugin 'tomlion/vim-solidity'
Plugin 'scrooloose/nerdcommenter'
Plugin 'posva/vim-vue'
Plugin 'vim-scripts/csv.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'davidhalter/jedi-vim'
" Plugin 'janko-m/vim-test'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = ","

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let test#python#runner = 'djangotest'
let g:jedi#popup_select_first = 0

set relativenumber
set undofile

nnoremap <C-p> :Files<cr>

nnoremap <Leader>t :TestNearest<cr>

nnoremap <Leader>1 :set foldlevel=0<cr>
nnoremap <Leader>2 :set foldlevel=1<cr>
nnoremap <Leader>3 :set foldlevel=2<cr>
nnoremap <Leader>4 :set foldlevel=3<cr>
nnoremap <Leader>5 :set foldlevel=4<cr>
nnoremap <Leader>6 :set foldlevel=5<cr>
nnoremap <Leader>7 :set foldlevel=6<cr>
nnoremap <Leader>8 :set foldlevel=7<cr>
nnoremap <Leader>9 :set foldlevel=8<cr>
nnoremap <Leader>0 :set foldlevel=99<cr>

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85


let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path='python'
let g:ycm_auto_trigger = 0

inoremap jj <ESC>:w<cr>

nmap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
nmap <leader>c :NercComToggleComment

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc

let g:ale_linters = {'javascript': ['eslint']}

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
"  nnoremap <space> za
set foldlevel=99
"----------Stop python PEP 8 stuff--------------


set background=dark
colorscheme zenburn

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu

set clipboard=unnamed

set diffopt=vertical

autocmd BufNewFile,BufRead  *.marko
	\ set syntax=html

set visualbell

" Treat <li> and <p> tags like the block tags they are
"let g:html_indent_tags = 'li\|p'
let g:html_indent_inctags ="html,body,head,tbody,li,p"

command! Tidyxml  :%!tidy -q -i --show-errors 0 -xml
command! Tidyjson :%!python -m json.tool
command! Tidyhtml :%!tidy -q -i --show-errors 0

map <F2> :NERDTreeToggle<CR>

map <pagedown> <Nop>
map <pageup> <Nop>
imap <pageup> <Nop>
imap <pagedown> <Nop>

set showmatch
hi MatchParen cterm=bold ctermbg=none ctermfg=red

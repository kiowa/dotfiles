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
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'jnurmine/Zenburn'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'tomlion/vim-solidity'
" Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'suy/vim-context-commentstring'
Plugin 'posva/vim-vue'
"Plugin 'vim-scripts/csv.vim'
" Plugin 'Valloric/MatchTagAlways'
" Plugin 'davidhalter/jedi-vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'jparise/vim-graphql'
Plugin 'janko-m/vim-test'
" Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-rhubarb'
" Plugin 'zxqfl/tabnine-vim'
" Plugin 'christianrondeau/vim-base64'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'elixir-editors/vim-elixir'
Plugin 'maxmellon/vim-jsx-pretty'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = ","

set path+=**
set wildmenu
set ignorecase
set smartcase


" keep undo on buffer switch
set hidden

set hlsearch

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if executable('ag')
  set grepprg=ag\ --vimgrep\ --smart-case\ --hidden\ --follow
endif

map <leader>* :grep <cword><CR><CR>

" Modify vim-test cmds to run inside Docker using custom transformations
function! DockerTransform(cmd) abort
  "return join(["docker-compose run --service-ports --no-deps --rm -v $(PWD):/app -w /app $(basename $(PWD))", a:cmd], " ")
  return join(["docker-compose run --rm app", a:cmd], " ")
endfunction
let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'
let test#strategy = 'vimterminal'

map <leader>t :TestNearest<cr>
map <leader>T :TestFile<cr>
map <leader>l :TestLast<cr>

" let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "bottom"

" line numbers
" set number
set relativenumber

" incremental searching
set incsearch

nnoremap <C-p> :Files<cr>
nnoremap <C-t> :Tags<cr>

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
" set colorcolumn=85


"let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_python_binary_path='python'
" let g:ycm_auto_trigger = 0
"
let g:ycm_language_server = [
      \ {
      \   'name': 'vue',
      \   'filetypes': [ 'vue' ],
      \   'cmdline': [ '/usr/bin/vls' ]
      \ }
      \]

inoremap jj <ESC>:w<cr>j

nmap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc

let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint']}
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'css': ['prettier'],
      \ 'html': ['prettier'],
      \ 'python': ['prettier'],
      \}
nmap <leader>f :ALEFix<cr>

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
"
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *js set tabstop=2

"spaces for indents
au BufRead,BufNewFile *.js set shiftwidth=2
au BufRead,BufNewFile *.js set expandtab
au BufRead,BufNewFile *.js set softtabstop=2

" terminal options
" au BufWinEnter * if &buftype=="terminal" | set nonumber | endif

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


set foldmethod=indent

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
"  nnoremap <space> za
set foldlevel=99
"----------Stop python PEP 8 stuff--------------


set background=dark
colorscheme zenburn

set nu

set clipboard=unnamed

set diffopt=vertical

autocmd BufNewFile,BufRead  *.marko
      \ set syntax=html


" autocmd BufEnter * :syntax sync fromstart

" VUE
autocmd BufNewFile,BufRead *.vue setf vue
autocmd FileType vue syntax sync fromstart
autocmd FileType vue set shiftwidth=2

let g:netrw_banner = 0
let g:netrw_browse_split = 1


set visualbell

" Treat <li> and <p> tags like the block tags they are
"let g:html_indent_tags = 'li\|p'
let g:html_indent_inctags ="html,body,head,tbody,li,p"

command! Tidyxml  :%!tidy -q -i --show-errors 0 -xml
command! Tidyjson :%!python -m json.tool
command! Tidyhtml :%!tidy -q -i --show-errors 0

" Accidentally hitting these on my keyboard - so disable.
map <pagedown> <Nop>
map <pageup> <Nop>
imap <pageup> <Nop>
imap <pagedown> <Nop>

set showmatch
hi MatchParen cterm=bold ctermbg=none ctermfg=red

"let g:gutentags_file_list_command = 'ag -l'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git', 'requirements.txt', 'Pipfile']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ '.hg': 'hg files',
      \ },
      \ }
" set tags=.git/tags

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" TEMPLATES
function! NewTemplateFile(fname)
  silent! execute "0r" a:fname
  silent! %s/FILENAME/\=expand("%:t:r")/g
endfunction

if has("autocmd")
  augroup templates
    autocmd BufNewFile test/*.js call NewTemplateFile("~/.vim/templates/test.js")
    autocmd BufNewFile *.vue call NewTemplateFile("~/.vim/templates/component.vue")
  augroup END
endif

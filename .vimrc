" This .vimrc file has been made following the url below: 
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" this .vimrc file is in order of the sections on the webpage
" Might need to cmake the YCMCore, see below: 
" https://github.com/ycm-core/YouCompleteMe#Installation

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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" Proper PEP8 indentation
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Formatting for other file types
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Autoindentation
Plugin 'vim-scripts/indentpython.vim'

" Flag unneccessary white space
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set encoding to UTF-8
set encoding=utf-8

" Auto Complete 
" -- 9/25/2019: Commented out because as of right now YCM is incompatible with 
"  anaconda's distribution of python 3
"
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1

" Syntax highlighting
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

" Colorscheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
call togglebg#map("<F5>")

" File tree/file structure
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Searching 
Plugin 'kien/ctrlp.vim'

" Line numbers
set nu

" Git (as in version control) integration 
Plugin 'tpope/vim-fugitive'

" Powerline displays current git branch, virtualenv, you name it 
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Access system keyboard
set clipboard=unnamed

" Restart YCMServer
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Remove excess whitespace
:command RW %s/\s\+$//e

let g:ycm_server_python_interpreter="/usr/local/bin/python"

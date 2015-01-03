set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"user plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/base16-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'itchyny/lightline.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Colour scheme
syntax enable
set background=dark
colorscheme solarized

"Statusline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': ''  }
      \ }

"Misc Settings
set nu
set backspace=indent,eol,start "Backspace can go back over anything
set mouse=a "Enable mouse support in terminals that support it
set wildignore=*.o,*.pyc
:set hidden
:nmap <Tab> :bn<CR>
:nmap <S-Tab> :bp<CR>

cmap w!! %!sudo tee > /dev/null %

"shifting does not leave visual mode
vnoremap < <gv
vnoremap > >gv

set expandtab "tabs are spaces
set tabstop=4
set softtabstop=4
set autoindent "Autoindent by default
set copyindent "Indent to same level as previous line by default
set shiftwidth=4 "Number of spaces to autoindent

set undolevels=1000
set showmode "show current mode in status line
set ruler "show cursor position in status line
set showcmd "show partial command in status line
set showmatch "show matching parenthesise


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

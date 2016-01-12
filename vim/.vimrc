set nocompatible              " be iMproved, required
filetype off                  " require

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'

Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-repeat' " lets me repeat maps
Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'raichoo/purescript-vim'

Plugin 'digitaltoad/vim-jade'

Plugin 'majutsushi/tagbar'
Plugin 'lambdatoast/elm.vim'

Plugin 'elixir-lang/vim-elixir'


Plugin 'kien/ctrlp.vim'

Plugin 'mattn/emmet-vim'

Plugin 'pangloss/vim-javascript'


Plugin 'klen/python-mode'

Plugin 'godlygeek/tabular'


Plugin 'fatih/vim-go'

Plugin 'Shougo/neocomplete.vim'

Plugin 'derekwyatt/vim-scala'
Plugin 'rust-lang/rust.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

syntax on

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8                   "A tab is 8 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple
set autoindent
set smartindent
set ignorecase
set smartcase

let mapleader=" "

" FIXME be warned. this might conflict we new plugins
map <Leader> <Plug>(easymotion-prefix)

nmap s <Plug>(easymotion-s)
" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
"
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
"EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
syntax enable
" solarized
if has('gui_running')
  set background=dark
  colorscheme solarized
  set guifont=Source\ Code\ Pro\ 10
endif
"set background=dark
"colorscheme solarized

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" close vim if nerdtree is last
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1



" this is nice
nnoremap <C-J> a<CR><Esc>k$


"set relativenumber 
set number
set cursorline
"set cursorcolumn
"set colorcolumn=80

" fuck you. Don't use the fucking arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"syntastic
map <silent> <Leader>e :Errors<CR>
"map <Leader>s :SyntasticToggleMode<CR>

nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1




set undofile

" ctrl+p
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

set mouse=a

set backspace=indent,eol,start
" tnoremap <Esc> <C-\><C-n>



nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


filetype on
filetype plugin on
filetype indent on " file type based indentation

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

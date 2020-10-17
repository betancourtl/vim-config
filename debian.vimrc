" Bundle Installation

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -- nerdtree --

" ctrl + n = open nerd tree
map <C-n> :NERDTreeToggle<CR>
" open tree when opening files
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open tree when opening directories
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close tree when tree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -- vim-gitgutter --
set updatetime=100

" --- Custom Config --

" Show numbers
set number
" Line number width
set nuw=2
" Tab space measuered in spaces
set tabstop=2
" inserts spaces
set softtabstop=0
" Size of an indent measuered in spaces
set shiftwidth=2
" inserts tabs as spaces
set expandtab
" Will make the indent go to the next tabstop
set smarttab

" -- theme --
syntax enable

" gruvbox
set background=dark    " Setting dark mode
autocmd vimenter * colorscheme gruvbox
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

set termguicolors
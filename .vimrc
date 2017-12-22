set autoindent showmatch
set number incsearch ignorecase hidden
set matchtime=1
set tabstop=4
set shiftwidth=4
syntax enable
colorscheme elflord
set nocompatible
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
" call neobundle#begin(expand('~/.vim/bundle/'))

" plugins here
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimfiler'

" call neobundle#end()
filetype plugin indent on

" powerline
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

set laststatus=2
set showtabline=2
set noshowmode
set cursorline


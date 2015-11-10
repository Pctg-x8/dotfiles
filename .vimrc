set autoindent showmatch
set number incsearch ignorecase hidden
set matchtime=1
set tabstop=4
set shiftwidth=4
syntax enable
colorscheme zenburn
set nocompatible
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" plugins here
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

call neobundle#end()
filetype plugin indent on

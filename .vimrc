set nocompatible
" filetype plugin indent on
" set audoindent
" set number
" set scrolloff=3

set mouse=a
set whichwrap+=<,>,h,l,[,]
set ts=4
set sts=0
set sw=0

hi CursorLine term=none cterm=none ctermbg=3


" Vim-Plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-sensible'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Initialize plugin system
call plug#end()

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

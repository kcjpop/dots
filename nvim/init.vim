"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set shell=/bin/sh

" Required:
set runtimepath+=/home/an/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/an/.cache/dein')
  call dein#begin('/home/an/.cache/dein')
  call dein#add('/home/an/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Language supports
  call dein#add('neoclide/coc.nvim', {'merge': 0, 'build': './install.sh nightly'})
  call dein#add('reasonml-editor/vim-reason-plus')

  " Colorscheme
  call dein#add('morhetz/gruvbox')

  " Utilities
  call dein#add('junegunn/vim-easy-align')
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call dein#add('Shougo/denite.nvim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('airblade/vim-gitgutter')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" Check and install plugins at startup
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

source ~/.config/nvim/base.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/denite.vim
source ~/.config/nvim/coc.vim

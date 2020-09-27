" Liempo's Vimrc for matebook
set encoding=utf-8

call plug#begin('~/.vim/plugged')
  " Xcode color scheme
  Plug 'arzg/vim-colors-xcode'

  " Basic essential stuff
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'preservim/nerdtree'
  Plug 'jiangmiao/auto-pairs'

  " Better incremental search
  Plug 'haya14busa/incsearch.vim'

  " Sxhkd syntax highlighting
  Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" I now hate escape, will replace it by jj
inoremap jj <Esc>
cnoremap jj <Esc>

" Space is the leader key
let mapleader=" "

" Set real terminal colors
set termguicolors
let g:airline_powerline_fonts = 1
colorscheme xcodedarkhc

" Shorter tabs because tabs is 4 spaces
set softtabstop=0 tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Show numbers
set number

" Automatically removing all trailing whitespace
autocmd BufWritePre <buffer> %s/\s\+$//e

" Set incremental search and enable the plugin
set incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Get off my lawn
nnoremap <Left> :echoe "Use 'h'"<CR>
nnoremap <Right> :echoe "Use 'l'"<CR>
nnoremap <Up> :echoe "Use 'k'"<CR>
nnoremap <Down> :echoe "Use 'j'"<CR>










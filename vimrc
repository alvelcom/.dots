 set nocompatible               " be iMproved
 filetype off                   " required!

 set path+=/usr/local/include,**
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 Bundle 'L9'
 Bundle 'mattn/webapi-vim'

 Bundle 'LnL7/vim-conque'
 Bundle 'tpope/vim-fugitive'
 Bundle 'kablamo/vim-git-log'

 Bundle 'mattn/gist-vim'
 Bundle 'FuzzyFinder'
 Bundle 'scrooloose/nerdtree'

 " Editing
 Bundle 'tpope/vim-speeddating'
 Bundle 'sjas/rainbow_parentheses'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'mileszs/ack.vim'

 Bundle 'scrooloose/syntastic'
 
 " Languages
 Bundle 'jimenezrick/vimerl'
 Bundle 'vim-erlang/vim-erlang-tags'
 Bundle 'gkz/vim-ls'
 Bundle 'digitaltoad/vim-jade'

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

map  <up>    :ls<cr>
map  <down>  <C-^>
map  <left>  :bp<cr>
map  <right> :bn<cr>
imap  <up>    <nop>
imap  <down>  <nop>
imap  <left>  <nop>
imap  <right> <nop>

" Set style
"===

syntax enable
colorscheme desert


"set relativenumber " - quite slow :'-(
set wildmenu
set scrolloff=3
set autoindent

set modeline

set tabstop=4
set shiftwidth=4
set expandtab

set spelllang=en,ru,de
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Some keyboard bindings
map <silent> <F2> :w<CR>
imap <F10> 

" OMNI
set ofu=syntaxcomplete#Complete

" VimErl
let erlang_skel_header = {'author': 'Paul Khusainov <alvelcom@gmail.com>',
                       \  'owner' : 'Paul Khusainov'}

" FuzzyFinder
noremap <silent> <F3> :FufCoverageFile<CR>

" NERDTree
noremap <silent> <F4> :NERDTreeToggle<CR>

" Tabs
noremap <silent> <F5> :tabnew<CR>


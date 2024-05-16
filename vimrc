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

 Bundle 'tpope/vim-fugitive'

 Bundle 'mattn/gist-vim'
 Bundle 'junegunn/fzf'
 Bundle 'junegunn/fzf.vim'

 " Editing
 Bundle 'mileszs/ack.vim'
 Bundle 'tpope/vim-unimpaired'
 Bundle 'wellle/context.vim'
 Bundle 'mg979/vim-visual-multi', {'branch': 'master'}

 " Languages
 Bundle 'fatih/vim-go'

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

" Set style
"===

syntax off

set wildmenu
set wildmode=longest:list,full
set scrolloff=3
set autoindent

set modeline

set tabstop=4
set shiftwidth=4
set expandtab

set breakindent
set breakindentopt=shift:4,sbr
set showbreak=-->

set spelllang=en,ru,de
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set formatoptions+=j
set foldmethod=indent
set foldlevel=1

set undodir=~/.dots/vim-undo
set undofile

" OMNI
set ofu=syntaxcomplete#Complete

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:fzf_history_dir = "~/.dots/fzf-history"

" Some keyboard bindings
map <silent> <F2> :w<CR>
imap <F10> 

" FuzzyFinder
" Tabs
noremap <silent> <F3> :FZF<CR>
noremap <silent> <F4> :Buffers<CR>
noremap <silent> <F5> :tabnew<CR>

" Context
let g:context_max_per_indent = 2

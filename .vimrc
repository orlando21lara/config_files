" Set compatibility to Vim only
set nocompatible

"Turn on syntax highlightling
syntax enable
filetype plugin indent on



"Plugins
call plug#begin('~/.vim/plugged')

"Smart Relative number plugin
Plug 'jeffkreeftmeijer/vim-numbertoggle'

"Auto pairs plugin
Plug 'jiangmiao/auto-pairs'

"Mutiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"C++ syntax highligthing
Plug 'octol/vim-cpp-enhanced-highlight'

"Surrounding
Plug 'tpope/vim-surround'
call plug#end()



"Help search for files
set path+=**	"Provides tab-completion for all file-related tasks
set wildmenu	"Display all matching files when we tab complete

"To copy things from other terminals
set clipboard=unnamedplus

let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1

colorscheme molokai

set nowrap sidescroll=1
set sidescrolloff=5
set scrolloff=5

set ttyfast
set laststatus=2

set showmode
set showcmd

set ignorecase
set smartcase

set number relativenumber
" Call the .vimrc.plug file

"press F4 to toggle highlighting search
noremap <C-h> :set hlsearch! hlsearch?<CR>
"press enter to temporarily exit highlight mode
noremap <CR> :nohlsearch<CR><CR>
"press space to fold or unfold a block
noremap <space> za

"Folding
set foldmethod=syntax

"Tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent


"Change cursor shape in insert mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"Change the filetype of launch files to XML
au BufRead,BufNewFile *.launch set filetype=xml

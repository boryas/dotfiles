set t_Co=256
:colors desert256
set autoindent
filetype indent on
filetype plugin on
filetype on
set tabstop=4
set shiftwidth=4
set expandtab
set guioptions-=T
set incsearch
set number
syntax on
let g:tex_flavor='latex'

map j gj
map k gk

set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*.cmi,*.aux*~  " Ignore certain files in tab-completion


augroup filetype
  au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
  au BufRead,BufNewFile *.cup             set filetype=cup
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim
au Syntax cup    so ~/.vim/syntax/cup.vim

set t_Co=256
set autoindent
filetype indent on
filetype plugin on
filetype on
set expandtab
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType python set tabstop=4|set shiftwidth=4
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

set guioptions-=T
set incsearch
set number

set foldmethod=syntax
set foldnestmax=1
hi Folded ctermbg=Black ctermfg=DarkBlue
hi Search ctermbg=DarkYellow ctermfg=Grey
syntax on

map j gj
map k gk
inoremap jk <ESC>

set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*.cmi,*.aux*~  " Ignore certain files in tab-completion

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F5> :TlistToggle<cr>
set tags=~/fbcode/tags,~/www/tags,~/fbcodehg/tags,~/local/linux/tags,~/local/btrfs-progs/tags,

let g:fb_hack_on = '0'

" remap a.vim commands to the keybindings I'm used to
" This is for switching between .h and .c (or .cpp) files
nmap ,s :A<CR>
nmap ,S :AV<CR>

noremap x "_x

" clang formatter
map <C-K> :pyf /usr/local/share/clang/clang-format.py<CR>
imap <C-K> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i

" linux formatting
let g:linuxsty_patterns = [ "/linux/", "/btrfs-progs/", "/xfstests/" ]

" latex
let g:tex_flavor='latex'

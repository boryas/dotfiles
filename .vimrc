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
let g:linuxsty_patterns = [ "/linux/", "/kernel/", "/btrfs-progs/", "/linux-mm/", "/fb-linux-5.2/", "/xfstests/", "/libbpf-bootstrap/", "/simoop/" ]

" color
set background=dark
let g:gruvbox_italicize_comments = '0'
colorscheme gruvbox
hi! link Comment GruvboxBlue
hi! link String GruvboxPurple
"hi! link Type GruvboxGreen
let g:cpp_member_highlight = '1'
let g:cpp_simple_highlight = '1'

" airline
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set t_Co=256
set autoindent
set expandtab
set hlsearch
filetype plugin indent on
filetype on
au FileType python set sw=4 ts=4 sta et fo=croql
au FileType make set noet
au FileType c set noet
au FileType sh set noet
au FileType markdown set tw=79
" bpftrace
au BufEnter *.bt set noet ft=bpftrace

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

" remap a.vim commands to the keybindings I'm used to
" This is for switching between .h and .c (or .cpp) files
nmap ,s :A<CR>
nmap ,S :AV<CR>

noremap x "_x

" clang formatter
map <C-K> :pyf /usr/local/share/clang/clang-format.py<CR>
imap <C-K> <ESC>:pyf /usr/local/share/clang/clang-format.py<CR>i

" linux formatting
" let g:linuxsty_patterns = [ "/linux/", "/kernel/", "/btrfs-progs/", "/linux-mm/", "/fb-linux-5.2/", "/xfstests/", "/libbpf-bootstrap/", "/simoop/" ]

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

" plugged
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
call plug#end()

" LSP stuff
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gD <plug>(lsp-declaration)
    nmap <buffer> gc <plug>(lsp-call-hierarchy-incoming)
    nmap <buffer> gC <plug>(lsp-call-hierarchy-outgoing)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [G <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]G <plug>(lsp-next-diagnostic)
    nmap <buffer> [g <plug>(lsp-previous-error)
    nmap <buffer> ]g <plug>(lsp-next-error)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

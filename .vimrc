
if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


filetype plugin indent on


call plug#begin()
"Plug 'brglng/vim-im-select'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/Vimball'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
"Plug 'junegunn/goyo.vim'
Plug 'rust-lang/rust.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/nginx.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/neocomplcache.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/nginx.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim'
Plug 'fatih/vim-go', { 'tag': '*'  }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim'  }
Plug 'flazz/vim-colorschemes'
"Plug 'connorholyday/vim-snazzy'

"Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

let mapleader=" " "map backslash to leader and will noremap this to <leader>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:javascript_plugin_jsdoc           = 1
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_arrow_function = "⇒"
let g:javascript_conceal_return         = "⇚"

let g:jsx_ext_required = 0

let g:coc_node_path = substitute(system('which node'), '\n', '', '')


"let g:im_select_default = 'com.apple.keylayout.ABC' 
"let g:im_select_command = '/usr/local/bin/im-select'


let g:airline_theme = 'hybrid'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap g :YcmCompleter GoTo

"set spell spelllang=en_us
set undofile
set encoding=utf-8
set fencs=ucs-bom,utf-8,euc-kr.latin1 " euc-kr if Korean, Unicode when unicode 
set tenc=utf-8      " terminal's encoding 
        
set foldmethod=indent
set foldlevel=99

set ignorecase

set mousehide               " Hide the mouse cursor while typing
set mouse=a                 " Automatically enable mouse usage

set termguicolors
set conceallevel=1
set background=dark

set cindent " C sytle auto indent

set scrolloff=2 
set shiftwidth=4
set expandtab
set tabstop=4
set hlsearch " Search highlight
set history=1000
set number

set undodir=~/.config/nvim/undodir

"map <F7> <ESC>:set mouse=a<CR>
"map <F8> <ESC>:set mouse-=a<CR>


map <Leader>c<space> <plug>NERDComComment

nmap <leader>t :NERDTreeToggle<CR>
nmap <F1> <nop>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <C-k> m`:m--<CR>==``
nnoremap <C-j> m`:m +1<CR>==``
nnoremap <S-l> $
nnoremap <S-h> ^
nnoremap d<S-l> d$
nnoremap d<S-h> d^

" disable search highlight when <esc> pressed
nnoremap <silent><esc> :noh<cr><C-l>
vnoremap <S-l> $
vnoremap <S-h> ^

" Visual shifting (does not exit Visual mode)
vnoremap <S-tab> <gv
vnoremap <tab> >gv

"Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
"vnoremap . :normal .<CR>

inoremap jk <esc>
inoremap jj <esc>
inoremap kk <esc>
inoremap kj <esc>


"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" easy motion config

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""coc config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


inoremap <silent><expr> <S-TAB>
      \ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
      \ <SID>check_back_space() ? "\<C-d>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetNext',[])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

"inoremap <silent><expr> <S-TAB>
    "\ pumvisible() ? "\<C-p>" :
    "\ coc#jumpable() ? "\<C-r>=coc#rpc#request('snippetPrev',[])\<CR>" :
    "\ "\<C-h>"

"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" inoremap <CR> --- 
" 1. when pumvisible & entry selected, which is a snippet, <CR> triggers snippet expansion,
" 2. when pumvisible & no entry selected, <CR> closes pum and inserts newline
" 3. when pum not visible, <CR> inserts only a newline
function! s:ExpandSnippetOrClosePumOrReturnNewline()
    if pumvisible()
        if !empty(v:completed_item)
            return "\<C-y>"
        endif
    else
        return "\<CR>"
    endif
endfunction
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrClosePumOrReturnNewline()<CR>


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<s-tab>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx
au BufRead,BufNewFile *.nginx set ft=nginx

" go to the position I was when last editing the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

autocmd BufEnter * lcd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""syntax
colorscheme jellybeans
hi Normal guifg=#F8F8F2 guibg=#000000
set t_ut=""

"red background issue 
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


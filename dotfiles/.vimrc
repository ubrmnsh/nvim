syntax enable
set noshowmode
set termguicolors

" set unicode characters
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=3

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" sets cursor as block
set guicursor=n-v-c:block-Cursor

" sets colorcolumn
set colorcolumn=72

" sets incremental search
set incsearch

" sets noswapfile
set noswapfile

" set title
set title

" show line numbers
set number

" highlight current line
set cursorline

" set highlight search
set nohlsearch

" let g:rehash256 = 1

" SQLCompletion Issue Fix
let g:omni_sql_no_default_maps = 1

" disable visual mode on click
set mouse-=a

" load filetype-specific indent files
filetype indent on

" when creating a new line, copy the indentation from line above
set autoindent

" visual autocomplete for command menu
set wildmenu

"---Switching Tabs Config"
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

set nocompatible

"--PLUGINS
call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', {'as':'dracula'}
call plug#end()

" set colorscheme
colorscheme dracula

"---EMMET CONFIG

"redefine trigger key

let g:user_emmet_leader_key=','
let g:tagalong_verbose = 1

"snippet for responsiveness
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

"---NERDTree Config
nnoremap <leader>n :NERDTreeFocus <CR>
nnoremap <C-n> :NERDTreeToggle <CR>
nnoremap <C-w> :q <CR>

"--vim-javascript ( colorful style )
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

"syntax highlighting for large files
autocmd BufEnter *.{js,jsx,ts,tsx} : syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} : syntax sync clear

"---FZF CONFIG"
noremap <silent> <C-f> :fzf<C-R>

"---LIGHTLINE CONFIG"
set laststatus=2

if !has('gui_running')
	set t_Co=256
endif

let g:lightline= {
\ 'colorscheme': 'molokai',
\}

"---RAINBOW CONFIG"
let g:rainbow_active = 1

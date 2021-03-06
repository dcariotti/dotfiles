autocmd! bufwritepost .vimrc source %

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim' 
Plugin 'airblade/vim-gitgutter' " display git status of the file
Plugin 'vim-airline/vim-airline' " airline at bottom with insert, name, line etc.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} | Plugin 'junegunn/fzf.vim' " fuzzy finder
Plugin 'luochen1990/rainbow' " color parentheses
Plugin 'dense-analysis/ale' " checker syntax
Plugin 'posva/vim-vue'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive' " git extension for commit logs and etc.
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ap/vim-css-color'
Plugin 'Yggdroot/indentLine'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'ryanoasis/vim-devicons'
Plugin 'edkolev/tmuxline.vim'

Plugin 'google/vim-searchindex'

call vundle#end()            " required

syntax on
colorscheme miramare

set clipboard=unnamed
set mouse=a " click with mouse
set wildmenu
set wildmode=longest,list:full
set wildignore=*~,*.png,*.jpg,*.gif,Thumbs.db,*.min.js,*.swp,*.o,vendor


set number " number of the current line
set relativenumber " relative number, ..-2 -1 x 1 2, where x is current line
set textwidth=80
set colorcolumn=80
set nowrap
set fo-=t

set tabstop=4
set shiftwidth=4
set expandtab " convert tabs in spaces

set ai " auto indent
set autoread

set encoding=UTF-8
set history=1000
set wildignore+=*.pyc

set hlsearch " highlight search
set incsearch

set nowritebackup
set laststatus=2

set cursorline

set list " spaces as characters
set listchars=eol:⏎,tab:»·,trail:ˑ,nbsp:⎵

set foldmethod=indent

set splitright " split on right side
set lazyredraw
set ttyfast

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

let g:fzf_preview_window = 'right:70%'

let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '🛑'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_info = '💭'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] [%linter%] %s'
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 3

let b:ale_linters = {
\   'python': ['flake8', 'pylint', 'mypy'],
\   'cpp': ['clang'],
\   'c': ['clang'],
\}

let b:ale_fixers = {
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vue': ['prettier'],
\   'html': ['prettier'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\}

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

let g:indentLine_char = '¦'

let g:vue_pre_processors = ['pug', 'scss']

let g:netrw_liststyle=1

filetype plugin indent on
set nocompatible

set showcmd " show commands at bottom

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" ------------
" MAPS
" -----------
nnoremap j gj
nnoremap k gk

nnoremap tn :tabnew<CR>
nnoremap :ve :Vexplore<CR>
nnoremap :rt :RainbowToggle<CR>

" buffers
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap ,b :Buffers<CR>

" tabs
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>
nnoremap ,t :tabs<CR>

" only one window
nnoremap ,o :only<CR>


" mapping fzf commands
" ff = open files explorer
" co = open commits explorer
" gf = open git ls-files
" gs = open git status
nnoremap :ff :Files .<CR>
nnoremap :co :Commits<CR>
nnoremap :gf :GFiles<CR>
nnoremap :gs :GFiles?<CR>
nnoremap :gd :Git diff<CR>

nnoremap :pa :set paste<CR>
nnoremap :npa :set nopaste<CR>

nmap :cr :!command cargo r<CR>
nmap <F6> :EditorConfigReload<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

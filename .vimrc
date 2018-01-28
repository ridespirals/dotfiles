" enable pathogen
execute pathogen#infect()
execute pathogen#helptags()

set scrolloff=10 " number of lines to show around cursor
set relativenumber " relative line numbers
set number " actualy line number for current line
set hlsearch " highlight search
set incsearch " progressive search
set expandtab " tabs -> spaces
set tabstop=4 " set tab width
set showmode " display current mode
set laststatus=2 " always show status line
set fileformat=unix " set unix line endings
set history=1000 " increase history from 20 to 1000
set ignorecase
set smartcase " ^ and this will only be case-sensitive if there's a capital letter
set autoindent
set clipboard^=unnamed
set hidden " better buffers - can be put in bg when not in use
set wildmenu " show other option in autocomplete
set wildmode=list:longest " only autocomplete up to ambiguity
set title
set shortmess=atI " fix some Press Enter messages

" split to the right and down
set splitbelow
set splitright

" set leader to <Space>
let mapleader=" "
noremap \ <Space>
nnoremap <Space> <Nop>

" remap ; <=> :
nnoremap ; :
nnoremap : :

set listchars=tab:>-,trail:·,eol:$ " whitespace
" toggle showing whitespace
nmap <silent> <Leader>s :set nolist!<CR> 

set backspace=2 " allow backspacing in insert mode over previously-written text (same as indent,eol.start
let g:netrw_liststyle=3 " make default :Explore style nicer

" splits - window
nmap <leader>sw<left>	:topleft vnew<CR>
nmap <leader>sw<right>	:botright vnew<CR>
nmap <leader>sw<up>		:topleft new<CR>
nmap <leader>sw<down>	:botright new<CR>

" splits - buffer
nmap <leader>s<left>	:leftabove vnew<CR>
nmap <leader>s<right>	:rightbelow vnew<CR>
nmap <leader>s<up>		:leftabove new<CR>
nmap <leader>s<dowN>	:rightbelow new<CR>

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" code folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" fast tabn/tabp
noremap <Leader>t :tabn<CR>
noremap <Leader>q :tabp<CR>

" paired - [v ]v for tabs
nnoremap [v :tabp<CR>
nnoremap ]v :tabn<CR>

" swap 0 and ^, use 0 to go to beginning of actual text, ^ to beginning of line
nnoremap 0 ^
nnoremap ^ 0

" leader->p to open fuzzyfinder
noremap <Leader>p :Files<CR>
noremap <C-p> :Files<CR>

" Ctrl+C for general closing
nnoremap <C-c> :close<CR>

" Command+j and Command+k to quickly navigate
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {

" Clear current search highlight by tapping //
nmap <silent> // :nohlsearch<CR>

" Vim reload current file (v)im (r)eload
nmap <silent> <Leader>vr :so %<CR>

" (h)tml (p)review
nmap <silent> <Leader>hp :!open -a Firefox %<CR><CR>

" syntax highlighting in conemu
syntax on " syntax highlighting
filetype on
filetype plugin on
filetype indent on

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme zenburn

" start window maximized
au GUIEnter * simalt ~x

" enable RainbowParentheses on startup
"au VimEnter * RainbowParenthesesToggle

augroup general_config
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-H> <C-W>h
	map <C-L> <C-W>l

	map <PageUp> <C-U>
	map <PageDown <C-D>
	imap <PageUp> <C-O><C-U>
	imap <PageDown> <C-O><C-D>
augroup END

" auto-expand %% to %:h<tab
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" change where swapfiles go
" - figure out how to only do this on mac
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

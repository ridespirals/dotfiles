set scrolloff=10 " number of lines to show around cursor 
set relativenumber " relative line numbers
set number " actualy line number for current line
set hlsearch " highlight search 
set incsearch " progressive search 
set tabstop=4 " set tab width
set showmode " display current mode
set laststatus=2 " always show status line
set fileformat=unix " set unix line endings
set history=1000 " increase history from 20 to 1000
set ignorecase

" set leader to <Space>
let mapleader=" "
noremap \ <Space>
nnoremap <Space> <Nop>

" remap ; <=> :
nnoremap ; :
nnoremap : :

set backspace=2 " allow backspacing in insert mode over previously-written text
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

" Ctrl+Space for Nerd Tree
noremap <C-Space> :NERDTree %:p:h<CR>

" syntax highlighting in conemu
syntax on " syntax highlighting
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme zenburn

" start window maximized
au GUIEnter * simalt ~x

" enable RainbowParentheses on startup
au VimEnter * RainbowParenthesesToggle

" testing <REMOVE ME>

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

" enable pathogen 
execute pathogen#infect()

" enable CtrlP extension?
set runtimepath^=/Users/John/vimfiles/bundle/ctrlp.vim

" change where swapfiles go
"set directory=/Users/John/vimfiles/swapfiles//
cd \hg

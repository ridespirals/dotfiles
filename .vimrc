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
set shiftwidth=4 " set indent width for '>'
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
set shortmess=atI " fix some Press Enter messages
set nocompatible

" split to the right and down
set splitbelow
set splitright

" set leader to <Space>
let mapleader=" "
noremap \ <Space>
nnoremap <Space> <Nop>

" remap ; <=> :
nnoremap ; :
"nnoremap : :

" find something to use for ; and , since i would like to use them but
" having ; mapped to : is too useful
nnoremap <Leader>, ,
nnoremap <Leader>; ;

set listchars=tab:>-,trail:·,eol:$ " whitespace
" toggle showing whitespace
nmap <silent> <Leader>s :set nolist!<CR>

set backspace=2 " allow backspacing in insert mode over previously-written text (same as indent,eol.start
let g:netrw_liststyle=3 " make default :Explore style nicer
let g:netrw_browse_split=0 " open file by re-using same window

" alternate half-page up/down
nnoremap <Leader>j <C-d>
nnoremap <Leader>k <C-u>

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


" paired - [v ]v for tabs
nnoremap <silent> [v :tabp<CR>
nnoremap <silent> ]v :tabn<CR>

" swap 0 and ^, use 0 to go to beginning of actual text, ^ to beginning of line
nnoremap 0 ^
nnoremap ^ 0

" leader->p to open fuzzyfinder
noremap <Leader>p :Files<CR>
noremap <C-p> :Files<CR>

" Ctrl+C for general closing
nnoremap <C-c> :close<CR>
" Shift+Ctrl+D for deleting buffers
nnoremap <C-g> :bd<CR>

" Command+j and Command+k to quickly navigate
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {

" F8 to indent entire document
map <F8> gg=G
map <F7> :/\s\+$/<CR>

" Clear current search highlight by tapping //
nmap <silent> // :nohlsearch<CR>:call clearmatches()<CR>

" Vim reload current file (v)im (r)eload
nmap <silent> <Leader>vr :so %<CR>

" (h)tml (p)review
nmap <silent> <Leader>hp :!open -a Firefox %<CR><CR>

" syntax highlighting in conemu
syntax on " syntax highlighting
filetype on
filetype plugin indent on

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme zenburn

" airline customization
let g:airline#extensions#tabline#enabled = 1

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


" quick editing shortcuts - easily edit common files
nnoremap <Leader>ev <C-w>s<C-w>j<C-w>L:e ~/.vimrc<CR>
nnoremap <Leader>eg <C-w>s<C-w>j<C-w>L:e ~/.gitconfig<CR>
nnoremap <Leader>eb <C-w>s<C-w>j<C-w>L:e ~/.bash_profile<CR>

" fugitive bindings
nnoremap ,s :Gstatus<CR>

" fuzzy finding (fzf)
nnoremap ,f :GFiles<CR>
" fuzzy finding open buffers
nnoremap ,b :Buffers<CR>
" use ag for fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" populate quickfix with open buffers
command! QBuffers call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}'))
" open buffer list and prepare a command to accept a number, easily open a buffer
nnoremap ,q :ls<CR>:b<Space>

" use the silver searcher instead of ack for ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

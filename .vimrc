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
set wildmode=longest:list,full " only autocomplete up to ambiguity
set shortmess=atI " fix some Press Enter messages
set nocompatible
set foldmethod=syntax " syntax folding (adding {{{/}}} to files sucks)
set nofoldenable " this makes it so folding doesn't happen when opening a file
set iskeyword+=- " add - to word text-object characters

" split to the right and down
set splitbelow
set splitright

" set leader to <Space>
let mapleader=" "
noremap \ <Space>
nnoremap <Space> <Nop>

" remap ; <=> :
nnoremap ; :

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
nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>l :Lexplore<CR>

"" in insert mode, having home and end available is nice
imap <c-l> <End>
imap <c-h> <Home>

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

" Ctrl+C for general closing
nnoremap <C-c> :close<CR>
" Shift+Ctrl+D for deleting buffers
nnoremap <C-g> :bd<CR>

" Command+j and Command+k to quickly navigate
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {

" press F5 to run Go scripts
autocmd FileType go map <buffer> <F5> :GoRun %<CR>

" F4 to format json
map <F4> :FormatJson<CR>
" F8 to indent entire document
map <F8> gg=G
" F7 to highlight all trailing whitepsace
map <F7> :/\s\+$/<CR>

" diff mode
map <F9> :diffget local<CR>
map <F10> :diffget remote<CR>

" Clear current search highlight by tapping //
nmap <silent> // :nohlsearch<CR>:call clearmatches()<CR>

" Vim reload current file (v)im (r)eload
nmap <silent> <Leader>vr :so %<CR>

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

" Control+j/k/h/l for moving between windows
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

" use groovy for Jenkinsfiles
au BufNewFile,BufRead Jenkinsfile setf groovy

" auto-expand %% to %:h<tab
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" change where swapfiles go
" - figure out how to only do this on mac
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" set vim cwd to open file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" quick editing shortcuts - easily edit common files
nnoremap <Leader>ev <C-w>s<C-w>j<C-w>L:e ~/.vimrc<CR>
nnoremap <Leader>eg <C-w>s<C-w>j<C-w>L:e ~/.gitconfig<CR>
nnoremap <Leader>eb <C-w>s<C-w>j<C-w>L:e ~/.bash_profile<CR>
nnoremap <Leader>ez <C-w>s<C-w>j<C-w>L:e ~/.zshrc<CR>

" fugitive bindings
nnoremap ,s :below Gstatus<CR>
nnoremap ,c :below Gcommit<CR>
nnoremap ,d :Gdiff<CR>
nnoremap ,B :Gblame<CR>

" [fzf] - fuzzy finding
" fuzzy finding tracked files
nnoremap ,f :GFiles<CR>
" fuzzy finding open buffers
nnoremap ,b :Buffers<CR>
" fuzzy finding all files
noremap <Leader>p :Files<CR>
noremap <C-p> :Files<CR>

" populate quickfix with open buffers
command! QBuffers call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{"bufnr":v:val}'))
" open buffer list and prepare a command to accept a number, easily open a buffer
nnoremap ,q :ls<CR>:b<Space>

" use the silver searcher instead of ack for ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    " use ag for fzf too
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
endif

" syntastic
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive'}
" use local eslint bin rather than global
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
" always populate errors list (not sure i want to use this yet)
" let g:syntastic_always_populate_loc_list = 1

" tig bindings - have to manually redraw screen after to get rid of "Press
" Enter" prompt
nnoremap <silent> ,t :!tig %<CR><C-l>
nnoremap <silent> ,T :!tig<CR><C-l>

" Prettier formatter - run on save
" noremap <Leader>f :PrettierAsync<CR>
nmap <Leader>f <Plug>(Prettier)
vnoremap <Leader>p :PrettierFragment<CR>

" autoformat on save for visualize only (so hacky i know but i'm not ready to
" do it to everything)
let g:prettier#autoFormat = 0
autocmd BufWritePre */unifi-repo/*.{js,jsx,css,html} PrettierAsync


" load custom commands from separate file
if filereadable(expand("~/.vimrc.commands"))
    source ~/.vimrc.commands
endif

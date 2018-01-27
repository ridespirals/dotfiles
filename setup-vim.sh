# copy vimfiles
cp -r vimfiles ~/.vim

# install Pathogen, unimpaired, and fugitive
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/tpope/vim-unimpaired.vim ~/.vim/bundle/vim-unimpaired
git clone https://github.com/tpope/vim-fugitive.vim ~/.vim/bundle/vim-fugitive

# install airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# install fzf
git clone https://github.com/junegunn/fzf.git ~/.vim/bundle/fzf
git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim


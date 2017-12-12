# copy vimfiles
cp -r vimfiles ~/.vim

# install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install airline
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

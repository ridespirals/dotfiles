# run with bash or conemu
mkdir -p ~/vimfiles/autoload ~/vimfiles/bundle && \
curl -LSso ~/vimfiles/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# add to _vimrc
# synatx on
# execute pathogen#infect()
# filetype plugin indent on

# vim airline
git clone https://github.com/vim-airline/vim-airline ~/vimfiles/bundle/vim-airline
# remember to run :Helptags to generate help tags


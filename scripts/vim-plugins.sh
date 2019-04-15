#!/bin/bash

#############
# Convenience script for all vim plugins.
# - clone repo if doesn't exist
# - otherwise, pull
#############

if [ ! -e "${HOME}/.vim/autoload/pathogen.vim" ]
then
    # likely setting up vim for the first time. install pathogen
    mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if [ ! -d "${HOME}/.vim/colors" ]
then
    # color schemes not in place, copy it over
    # TODO: get colors online? copy from dotfiles?
    echo "++ vim colors not found, copying schemes."
    mkdir -p "${HOME}/.vim/colors"
    mkdir "${HOME}/.vim/autoload"
    cp -R ./vimfiles/colors "${HOME}/.vim/colors"
    cp -R ./vimfiles/autoload "${HOME}/.vim/autoload"
fi

if [ ! -f "${HOME}/.vim/filetype.vim" ]
then
    cp -R ./vimfiles/filetype.vim "${HOME}/.vim/filetype.vim"
fi

bold=$(tput bold)
blue=$(tput setaf 4)
green=$(tput setaf 2)
normal=$(tput sgr0)

DIR="$HOME/.vim/bundle"
PLUGINS=(
    "ajh17/VimCompletesMe"
    "AndrewRadev/splitjoin.vim"
    "digitaltoad/vim-pug"
    "dracula/vim"
    "editorconfig/editorconfig-vim"
    "etdev/vim-hexcolor"
    "fatih/vim-go"
    "itmammoth/doorboy.vim"
    "junegunn/fzf"
    "junegunn/fzf.vim"
    "OrangeT/vim-csharp"
    "mattn/emmet-vim"
    "mileszs/ack.vim"
    "tpope/vim-characterize"
    "tpope/vim-commentary"
    "tpope/vim-dotenv"
    "tpope/vim-fugitive"
    "tpope/vim-repeat"
    "tpope/vim-surround"
    "tpope/vim-unimpaired"
    "pangloss/vim-javascript"
    "vim-airline/vim-airline"
    "vim-airline/vim-airline-themes"
    "vim-scripts/dbext.vim"
    "vim-syntastic/syntastic"
)

for P in ${!PLUGINS[*]}
do
    REPO=${PLUGINS[P]}
    PLUG_NAME=$(echo $REPO | cut -d'/' -f2)
    PLUG_DIR="${DIR}/${PLUG_NAME}"

    printf "→ ${bold}${PLUG_NAME}${normal}: "

    if [ -d ${PLUG_DIR} ]
    then
        # cd and git pull
        # TODO: use printf to keep it neat on one line
        cd $PLUG_DIR
        git fetch > /dev/null 2>&1
        if [[ $(git log HEAD..origin | wc -c) -ne 0 ]]
        then
            git pull > /dev/null 2>&1
            printf "${green}updated.${normal}\n"
        else
            # no changes
            printf "no changes.\n"
        fi
    else
        # clone repo
        printf "${blue}installed.${normal}"
        git clone "git@github.com:${REPO}.git" $PLUG_DIR > /dev/null 2>&1
    echo
    fi
done
printf "${bold}${green}✓${normal} ${bold}Finished.${normal}\n"

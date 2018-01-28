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
    echo "++ Colors not found! Go get zenburn somewhere."
fi


DIR="$HOME/.vim/bundle"
PLUGINS=(
    "tpope/vim-unimpaired" 
    "tpope/vim-fugitive"
    "tpope/vim-vinegar"
    "tpope/vim-commentary"
    "tpope/vim-characterize"
    "tpope/vim-surround"
    "vim-airline/vim-airline"
    "junegunn/fzf"
    "junegunn/fzf.vim"
)
for P in ${!PLUGINS[*]}
do
    REPO=${PLUGINS[P]}
    PLUG_NAME=$(echo $REPO | cut -d'/' -f2)
    PLUG_DIR="${DIR}/${PLUG_NAME}"
    REPO_PATH="git@github.com:${REPO}.git"

    if [ -d ${PLUG_DIR} ]
    then
        # cd and git pull
        echo "^ Updating ${PLUG_NAME}"
        cd $PLUG_DIR
        git fetch
        git pull > /dev/null
    else
        # clone repo
        echo "+ Installing ${PLUG_NAME}"
        git clone $REPO_PATH $PLUG_DIR
        git clone "git@github.com:${REPO}.git" $PLUG_DIR
    echo
    fi
done


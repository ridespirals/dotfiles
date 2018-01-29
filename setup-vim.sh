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
    "sheerun/vim-polyglot"
)
for P in ${!PLUGINS[*]}
do
    REPO=${PLUGINS[P]}
    PLUG_NAME=$(echo $REPO | cut -d'/' -f2)
    PLUG_DIR="${DIR}/${PLUG_NAME}"

    if [ -d ${PLUG_DIR} ]
    then
        # cd and git pull
        # TODO: use printf to keep it neat on one line
        echo "^ Updating ${PLUG_NAME}"
        cd $PLUG_DIR
        git fetch
        if [[ $(git log HEAD..origin | wc -c) -ne 0 ]]
        then
            git pull > /dev/null
            echo " + plugin updated"
        else
            # no changes
            echo " - no changes"
        fi
    else
        # clone repo
        echo "+ Installing ${PLUG_NAME}"
        git clone "git@github.com:${REPO}.git" $PLUG_DIR
    echo
    fi
done


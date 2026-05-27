#!/usr/bin/env bash

# Initial setup script for macos
# - create environment variables $DOTFILES for use in other places/scripts
# - create symlinks to all personal dotfiles
# - set up custom updater script to be in $PATH

# logging colors
bold=$(tput bold)
light=$(tput setaf 8)
blue=$(tput setaf 4)
green=$(tput setaf 2)
normal=$(tput sgr0)
cyan=$(tput setaf 14)

# dotfiles dir. maybe find a better way to do this?
DOTFILES="${HOME}/source/dotfiles"

# link up dotfiles
FILES=(
    ".zshrc"
    ".inputrc"
    ".vimrc"
    ".vimrc.commands"
    ".gitconfig"
    ".tigrc"
    ".profile"
)
for ITEM in ${!FILES[*]}
do
    F=${FILES[ITEM]}
    if [ ! -f "$HOME/$F" ]
    then
        ln -s "$DOTFILES/$F" "$HOME/$F"
        printf "+ linked ${bold}${F}${normal} ${green}successfully${normal}.\n"
    else
        printf "+ ${bold}${F}${normal} ${blue}already exists${normal}.\n"
    fi
done

# link homebrew update script
if [ ! -f /usr/local/bin/bb ]
then
    ln -s "$DOTFILES/homebrew" /usr/local/bin/bb
    chmod +x /usr/local/bin/bb
fi

# create a tmp folder for vim swap/backup files
if [ ! -d "$HOME/.vim-tmp" ]
then
    mkdir "$HOME/.vim-tmp"
fi

# create folder for vim sessions
if [ ! -d "$HOME/.vim-sessions" ]
then
    mkdir "$HOME/.vim-sessions"
fi

# link keybinding dict - make Home/End keys behave like windows
if [ ! -f "$HOME/Library/Keybindings/DefaultKeyBindings.dict" ]
then
    echo "+ KeyBinding dict not found, linking file"
    mkdir -p "$HOME/Library/KeyBindings"
    ln -s "$DOTFILES/DefaultKeyBinding.dict" "$HOME/Library/KeyBindings/DefaultKeyBinding.dict"
fi

# create updater script
if [ ! -f "/usr/local/bin/updates" ]
then
    echo "sh $DOTFILES/scripts/homebrew\nsh $DOTFILES/scripts/vim-plugins.sh" > /usr/local/bin/updates
    chmod +x /usr/local/bin/updates
fi

# SSH setup (for github)
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)" # start ssh agent in the background
# edit ~/.ssh/config
# Host *
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_rsa
# ssh-add -K ~/.ssh/id_rsa

# now install homebrew and basic packages
# - if there was a way to request this from brew.sh, that would be cool (TODO)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fzf git ag jj nvm tig vim tree wget dropbox fork iterm2 keepassxc steam vlc qlmarkdown

echo
echo "${bold}${blue}macos setup completed. remaining tasks${normal}"
echo "💠 install ${green}${bold}nvm${normal} ${light}(do not install node through brew)${normal}"
echo "  $ ${cyan}curl -o- https://githubusercontent.com | bash${normal}"
echo "  $ ${cyan}nvm install node${normal} ${light}# alias for latest${normal}"
echo "  $ ${cyan}nvm alias default node${normal} ${light}# should set default for all terminals${normal}"
echo
echo "💠 install ${green}${bold}bun${normal}"
echo "  \$${cyan} curl -fsSL https://bun.sh/install | bash${normal}"
echo

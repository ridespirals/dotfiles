# disable hibernate (faster sleeps)
sudo pmset -a hibernatemode 0
# can then "sudo rm /var/vm/sleepimage" to save space

# disable Sudden Motion Sensor (for SSD-only systems)
sudo pmset -a sms 0

# enable three-finger drag
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

# set default screenshot location
screenshots="Documents/Screenshots"
if [ ! -d "$HOME/$screenshots" ]
then
    mkdir -p "$HOME/$screenshots"
    defaults write com.apple.screencapture location "$HOME/$screenshots"
fi

# dotfiles dir. maybe find a better way to do this?
DOTFILES="${HOME}/source/dotfiles"

# link up dotfiles
if [ ! -f "$HOME/.zshrc" ]
then
    ln -s "$DOTFILES/.zshrc" "$HOME/.zshrc"
fi
if [ ! -f "$HOME/.inputrc" ]
then
    ln -s "$DOTFILES/.inputrc" "$HOME/.inputrc"
fi
if [ ! -f "$HOME/.vimrc" ]
then
    ln -s "$DOTFILES/.vimrc" "$HOME/.vimrc"
fi
if [ ! -f "$HOME/.vimrc.commands" ]
then
    ln -s "$DOTFILES/.vimrc.commands" "$HOME/.vimrc.commands"
fi
if [ ! -f "$HOME/.gitconfig" ]
then
    ln -s "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
fi
if [ ! -f "$HOME/.tigrc" ]
then
    ln -s "$DOTFILES/.tigrc" "$HOME/.tigrc"
fi

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


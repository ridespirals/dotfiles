# disable hibernate (faster sleeps)
sudo pmset -a hibernatemode 0
# can then "sudo rm /var/vm/sleepimage" to save space

# disable Sudden Motion Sensor (for SSD-only systems)
sudo pmset -a sms 0

# dotfiles dir. maybe find a better way to do this?
DOTFILES="${HOME}/source/dotfiles"

# link up dotfiles
ln -s "$DOTFILES/.bashrc" "$HOME/.bash_profile"
ln -s "$DOTFILES/.inputrc" "$HOME/.inputrc"
ln -s "$DOTFILES/.vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/.bash-powerline.sh" "$HOME/.bash-powerline.sh"

# link homebrew update script
ln -s homebrew /usr/local/bin/bb
chmod +x /usr/local/bin/bb

# create a tmp folder for vim swap/backup files
mkdir ~/.vim-tmp

# link keybinding dict - make Home/End keys behave like windows
if [ ! -f "$HOME/Library/Keybindings/DefaultKeyBindings.dict" ]
then
    echo "+ KeyBinding dict not found, linking file"
    mkdir -p "$HOME/Library/KeyBindings"
    ln -s "$DOTFILES/DefaultKeyBinding.dict" "$HOME/Library/KeyBindings/DefaultKeyBinding.dict"
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


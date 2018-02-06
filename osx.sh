# disable hibernate (faster sleeps)
sudo pmset -a hibernatemode 0
# can then "sudo rm /var/vm/sleepimage" to save space

# disable Sudden Motion Sensor (for SSD-only systems)
sudo pmset -a sms 0

# link up dotfiles
ln -s .bashrc ~/.bash_profile
ln -s .inputrc ~/.inputrc
ln -s .vimrc ~/.vimrc
ln -s .gitconfig ~/.gitconfig
ln -s .netrc ~/.netrc

# link homebrew update script
ln -s homebrew /usr/local/bin/bb
chmod +x /usr/local/bin/bb

# create a tmp folder for vim swap/backup files
mkdir ~/.vim-tmp

# SSH setup (for github)
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# eval "$(ssh-agent -s)" # start ssh agent in the background
# edit ~/.ssh/config
# Host *
#   AddKeysToAgent yes
#   UseKeychain yes
#   IdentityFile ~/.ssh/id_rsa
# ssh-add -K ~/.ssh/id_rsa


# disable hibernate (faster sleeps)
sudo pmset -a hibernatemode 0
# can then "sudo rm /var/vm/sleepimage" to save space

# disable Sudden Motion Sensor (for SSD-only systems)
sudo pmset -a sms 0

# link up dotfiles
ln .bashrc ~/.bash_profile
ln .inputrc ~/.inputrc
ln .vimrc ~/.vimrc
ln .gitconfig ~/.gitconfig


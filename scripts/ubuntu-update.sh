printf "Updating..."
sudo apt update
printf "finished.\n"

printf "Upgrading packages..."
#sudo apt upgrade /y
sudo apt full-upgrade
printf "finished\n."

printf "Upgrading distribution..."
sudo apt dist-upgrade
printf "finished\n."

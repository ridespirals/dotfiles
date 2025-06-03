# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# xinput set-prop 11 "libinput Accel Speed" -0.65

if command -v setxkbmap &> /dev/null; then
    # make caps lock escape (linux)
    setxkbmap -option caps:escape
fi

# autodesk stuff
export cypress_adsk_account_server="https://accounts-staging.autodesk.com"
export cypress_username="nifi.e2e.test.003@ssttest.net"
export cypress_password="\$2y\$10\$p*No9AAC%D6Hjm.Uga_b47BnPNlFj_xeAkVcd9_%2"

alias python="/opt/homebrew/bin/python3"

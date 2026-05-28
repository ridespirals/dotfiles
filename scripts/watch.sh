#!/usr/bin/env bash

# *********************************************
# simple script to run another script periodically
# useful for writing things like echo/output with formatting (colors, etc) and getting live feedback
# *********************************************

set -uo pipefail
# prevent watcher from blowing up if script its watching has error
set +e

red=$(tput setaf 9)
purple=$(tput setaf 5)
ident="$(tput setaf 2)$(tput bold)"
green=$(tput setaf 2)
blue=$(tput setaf 4)
normal=$(tput sgr0)

SCRIPT="${1}"
DELAY="${2:-2}"

# validate script
if [ ! -f $SCRIPT ]; then
    echo "${red}script file not found${normal} ${purple}$SCRIPT${normal}"
    exit 1
fi

# validate time
if [ "$DELAY" -eq "$DELAY" ] 2>/dev/null; then
    : # do nothing
else
    echo "${red}time is invalid${normal} ${purple}$DELAY${normal}"
fi

echo "Watching script ${ident}$SCRIPT${normal} with delay ${ident}$DELAY${normal}"
sleep $DELAY

while true; do
    sh $SCRIPT
    sleep $DELAY
done


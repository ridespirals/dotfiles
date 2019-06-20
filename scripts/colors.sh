for i in {0..255} ; do
  printf "\x1b[38;5;${i}mcolor${i}\t"
done

printf "\n\n\n\n\n"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

printf "${GREEN}GREEN\t\t${BRIGHT}GREEN BRIGHT${NORMAL}\n"
printf "${BLACK}BLACK\t\t${BRIGHT}BLACK BRIGHT${NORMAL}\n"
printf "${RED}RED\t\t${BRIGHT}RED BRIGHT${NORMAL}\n"
printf "${YELLOW}YELLOW\t\t${BRIGHT}YELLOW BRIGHT${NORMAL}\n"
printf "${LIME_YELLOW}LIME_YELLOW\t\t${BRIGHT}LIME_YELLOW BRIGHT${NORMAL}\n"
printf "${POWDER_BLUE}POWDER_BLU\t\t${BRIGHT}POWDER_BLU BRIGHT${NORMAL}\n"
printf "${BLUE}BLUE\t\t${BRIGHT}BLUE BRIGHT${NORMAL}\n"
printf "${MAGENTA}MAGENTA\t\t${BRIGHT}MAGENTA BRIGHT${NORMAL}\n"
printf "${CYAN}CYAN\t\t${BRIGHT}CYAN BRIGHT${NORMAL}\n"
printf "${WHITE}WHITE\t\t${BRIGHT}WHITE BRIGHT${NORMAL}\n"

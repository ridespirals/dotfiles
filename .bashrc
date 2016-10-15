export PATH="/usr/local/sbin:$PATH"

alias ls='ls -AGFoh'

# ls with colors and all files
#alias ls='ls -laG'

alias bb='echo "Updating homebrew..." && brew update && echo "Upgrading formulae" && brew upgrade && echo "System is up to date."'

# sbin in path (for homebrew)
#export PATH='/usr/local/sbin:$PATH'

# git aliases
alias s='git status -s'
alias gs='git status'
alias a='git add'
alias c='git commit --verbose'
alias push='git push'
#l = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short

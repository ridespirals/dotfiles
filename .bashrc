export PATH="/usr/local/sbin:$PATH"

alias ls='ls -AGFoh'

alias love='/Applications/love.app/Content/MacOS/love'

# ls with colors and all files (edit)
#alias ls='ls -laG'

alias bb='echo "Updating homebrew..." && brew update && echo "Upgrading formulae..." && brew upgrade && echo "Deleting old formulae..." && echo "Checking system..." && brew cleanup && brew doctor'

# sbin in path (for homebrew)
#export PATH='/usr/local/sbin:$PATH'

# git aliases
alias s='git status -s'
alias gs='git status'
alias a='git add'
alias c='git commit --verbose'
alias push='git push'
#l = log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short

# lua love
alias love="/Applications/love.app/Contents/MacOS/love"

# generate sublime project
alias sublimeproject="echo '{\"folders\":[{\"path\":\".\"}]}' > '$1.sublime-project'"

# find current ip address
alias myip="curl ipecho.net/plain ; echo"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# git branch PS1 bash prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


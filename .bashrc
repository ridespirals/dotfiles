export PATH="/usr/local/sbin:$PATH"

alias ls='ls -AGFoh'

alias love='/Applications/love.app/Content/MacOS/love'

# ls with colors and all files (edit)
#alias ls='ls -laG'

# sbin in path (for homebrew)
#export PATH='/usr/local/sbin:$PATH'

# hg aliases
alias hgin='hg incoming | grep changeset | wc -l'

# git aliases
alias s='git status -s'
alias gs='git status'
alias a='git add'
alias c='git commit --verbose'
alias pull='git pull'
alias push='git push'
alias gitl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# lua love
alias love="/Applications/love.app/Contents/MacOS/love"

# ctags alias for better javascript ctags
#alias jtags=”ctags -R app config lib && sed -i '' -E '/^(if|switch|function|module\.exports|it|describe).+language:js$/d' tags”

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

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

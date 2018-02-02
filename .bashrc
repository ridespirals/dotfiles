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
alias changes='git log --oneline --graph --stat --dirstat'

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
parse_hg_branch() {
    hg branch 2> /dev/null | sed -e '/^[^*]/ \[\1\]/'
}
#export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="\W\[\033[32m\]\$(parse_git_branch) \$(parse_hg_branch)\[\033[00m\] $ "
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#source $HOME/.bash-powerline.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# screensaver. call pipes.sh if it exists
if [[ $(which pipes.sh | wc -c) -ne 0 ]]; then
    # TODO: chose a random pipe char (including none for thd defaults
    RANGE=5
    number=$RANDOM
    let "number %= $RANGE"
    alias ss="pipes.sh -t c################ -p 2"
fi

# when using zenburn, use bright blue for directories (like ls)
#LSCOLORS=$LSCOLORS:'d=0;35:' ; export LSCOLORS
